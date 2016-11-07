require 'qbwc'

namespace :quickbooks do
  desc "TODO"
  task tables: :environment do
    queries = ['Customer', 'Estimate', 'Invoice', 'PurchaseOrder', 'SalesOrder']
   lines = []
   queries.each do |q|
     lines << "class Create#{q.pluralize} < ActiveRecord::Migration[5.0]"
     lines << " def change"
     lines << "  create_table :#{q.tableize} do |t|"
       xml = QBWC.parser.describe("#{q}Ret")
         xml.elements.each do |x|
        name = x.name.underscore
        klass = x.children.text.downcase
        if name.match /ref$|address$|block$|info$|ret$|txn$/
           lines << "   t.string :#{name} # TODO references #{name}"
        else
           case klass
            when "strtype", "guidtype", "idtype"
             lines << "   t.string :#{name}"
            when "datetimetype"
             lines << "   t.datetime :#{name}"
           when "enumtype"
           lines << "   t.string :#{name} # TODO enum type - #{name}"
            when "inttype"
             lines << "   t.integer :#{name}"
            when "datetype"
             lines << "   t.date :#{name}"
            when "floattype"
             lines << "   t.float :#{name}, :precision => 10, :scale => 2, :null => false, :default => 0"
            when "booltype"
             lines << "   t.boolean :#{name}, :null => false, :default => true"
            when "amttype"
             lines << "   t.decimal :#{name}, :precision => 10, :scale => 2, :null => false, :default => 0.00"
            when "percenttype"
             lines << "   t.float :#{name}, :precision => 10, :scale => 2, :null => false, :default => 0.00, :min => 0, :max => 100"
            else
             lines << "   t.#{klass} :#{name}"
            end
        end
       end
       lines << ""
       lines << "   t.timestamps null: false"
       lines << "  end"
       lines << " end"
       lines << "end"
       lines << ""
       lines << ""
      end
    puts lines
  end

  desc "TODO"
  task generate_scaffolds: :environment do
    queries = QBWC.parser.types(/Ret$/).sort!
   lines = ""
   queries.each do |q|
     xml = QBWC.parser.describe("#{q}")
     q.remove!(/Ret$/)
     if xml.elements.present?
          lines += "rails g scaffold #{q.classify}"
          xml.elements.each do |x|
            lines += " #{x.name.underscore}"
              klass = x.children.text.downcase!
              case klass
                when "datetimetype"
                  lines += ":datetime"
                when "inttype"
                  lines += ":integer"
                when "datetype"
                  lines += ":date"
                when "floattype", "percenttype"
                  lines += ":float{'10,2'}"
                when "booltype"
                  lines += ":boolean"
                when "amttype"
                  lines += ":decimal{'15,2'}"
                else
                  next
              end
             end
          lines += "\n\n\n"
        end
      end
    puts lines
  end
  end