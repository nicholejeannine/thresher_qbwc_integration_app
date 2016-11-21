require 'qbwc'

namespace :quickbooks do
  desc "TODO"
  task tables: :environment do
    queries = ['Customer', 'Estimate', 'Invoice', 'PurchaseOrder', 'SalesOrder', "EstimateLine", "InvoiceLine", "PurchaseOrderLine", "SalesOrderLine", "Vendor"]
   lines = []
   queries.each do |q|
     lines << "class Create#{q.pluralize} < ActiveRecord::Migration[5.0]"
     lines << " def change"
     lines << "  create_table :#{q.tableize}, id: false do |t|"
     lines << "   t.string :id, :primary_key => true"
     xml = QBWC.parser.describe("#{q}Ret")
     if xml.elements.present?
       xml.elements.each do |x|
        name = x.name.underscore
        if name == "ship_address"
          lines << "    t.string :ship_address_addr1\n t.string :ship_address_addr2\n t.string :ship_address_addr3\n t.string :ship_address_addr4\n t.string :ship_address_addr5\n t.string :ship_address_city\n t.string :ship_address_state\n t.string :ship_address_postal_code\n t.string :ship_address_country\n t.string :ship_address_note\n"elsif name =="bill_address"
        elsif name == 'bill_address'
          lines+= "  t.string :bill_address_addr1\n t.string :bill_address_addr2\n t.string :bill_address_addr3\n t.string :bill_address_addr4\n t.string :bill_address_addr5\n t.string :bill_address_city\n t.string :bill_address_state\n t.string :bill_address_postal_code\n t.string :bill_address_country\n t.string :bill_address_note\n"
        else
          klass = x.children.text.downcase
          case klass
            when "strtype", "guidtype", "idtype"
              lines << "    :#{name}"
            when "datetimetype"
             lines << "   t.datetime :#{name}"
            when "enumtype"
              lines << "    :#{name} # TODO enum type - #{name}"
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
            end # end case
        end # end if/else
       end # end each xml element
     lines << "   t.timestamps null: false"
     lines << "  end"
     lines << " end"
     lines << "end"
     lines << ""
     lines << ""
     end # end if xml items present
    end # end each query
    puts lines
  end # end task

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
            name = x.name.underscore
            # if name.match /ship_to_address|block$/
              # next
            # elsif name == "ship_address"
            #   lines += " ship_address_addr1 ship_address_addr2 ship_address_addr3 ship_address_addr4 ship_address_addr5 ship_address_city ship_address_state ship_address_postal_code ship_address_country ship_address_note"
            # elsif name =="bill_address"
            #   lines+= " bill_address_addr1 bill_address_addr2 bill_address_addr3 bill_address_addr4 bill_address_addr5 bill_address_city bill_address_state bill_address_postal_code bill_address_country bill_address_note"
            # else
            # name.sub!(/ref$/, "id")
            # name.sub!(/ret$/, "id")
              klass = x.children.text.downcase!
               if name.match /memo$|note$|notes$/
                lines += " #{name}:text"
              else
                lines += " #{name}"
              end
              case klass
              when "idtype"
                  lines += ":index"
                when "datetimetype"
                  lines += ":datetime"
                when "inttype"
                  lines += ":integer"
                when "datetype"
                  lines += ":date"
                when "floattype", "percenttype"
                  lines += ":float"
                when "booltype"
                  lines += ":boolean"
                when "amttype"
                  lines += ":decimal{'15,2'}"
                else
                  next
              end
             end
           # end
          lines += " \n\n\n"
        end
      end
    puts lines
  end
  end