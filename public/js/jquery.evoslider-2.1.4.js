/**
 * Evo Slider Pro v2.1.4 - jQuery Slideshow and Content Slider Plugin
 * http://evoslider.com
 * 
 * Copyright 2013, Fikri Rakala
 * 
 * Licensed under the CodeCanyon License
 * http://codecanyon.net/licenses/regular_extended
 * 
 * Date: June 27th 2013
 */ 
 
(function( $, window, document, undefined ) {

// constant
var VERSION = 2.14,

    // the Utils singleton
    Utils = (function() {
        return {
            array : function( obj ) {
                return Array.prototype.slice.call(obj, 0);
            },
            
            getExternalData: function ( dataType, dataUrl, success, fail, complete ) {
                $.ajax({
                    type: "GET",
                    dataType: dataType, 
                    url: dataUrl,
                    error: fail,
                    success: success,
                    complete: complete
                });
            }, 
        
            fileTypes: {
                images: {
                    reg: /\.(jpg|jpeg|gif|png|bmp|tiff)(.*)?$/i,
                    type: "image"
                },
                
                youtube: {
                    reg: /youtube\.com\/watch/i, 
                    split: "=", 
                    index: 1,
                    url: "http://www.youtube.com/embed/%id%?wmode=transparent", 
                    type: "video",
                    getThumb: function( id, success, fail ) {
                        $.getJSON('http://gdata.youtube.com/feeds/api/videos/' + id + '?v=2&alt=json-in-script&callback=?', function( data ){ 
                             try {
                                success( data.entry.media$group.media$thumbnail[0].url );
                             } catch(e) {
                                fail();
                             }
                        }).error( fail );
                    }, 
                    getImage: function ( id, success, fail ) {
                        $.getJSON('http://gdata.youtube.com/feeds/api/videos/' + id + '?v=2&alt=json-in-script&callback=?', function( data ){ 
                             try {
                                success( data.entry.media$group.media$thumbnail[2].url );
                             } catch(e) {
                                fail();
                             }
                        }).error( fail );
                    }
                },
                        
                vimeo: {
                    reg: /vimeo\.com/i,
                    split: "/",
                    index: 3,
                    url: "http://player.vimeo.com/video/%id%?", 
                    type: "video",
                    getThumb: function( id, success, fail ) {
                        $.getJSON('http://vimeo.com/api/v2/video/' + id + '.json?callback=?', function(data) {
                            try {
                                success( data[0].thumbnail_medium );
                            } catch(e) {
                                fail();
                            }
                        }).error( fail );
                    }, 
                    getImage: function ( id, success, fail ) {
                        $.getJSON('http://vimeo.com/api/v2/video/' + id + '.json?callback=?', function(data) {
                            try {
                                success( data[0].thumbnail_large );
                            } catch(e) {
                                fail();
                            }
                        }).error( fail );
                    }                    
                },
                
                dailymotion: {
                    reg: /dailymotion\.com\/video/i,
                    split: "/",
                    index: 4,
                    url: "http://www.dailymotion.com/embed/video/%id%?",
                    type: "video",
                    getThumb: function( id, success, fail ) { 
                        $.getJSON('https://api.dailymotion.com/video/'+id+'?fields=thumbnail_medium_url&callback=?', function(data) {
                            try {
                                success( data.thumbnail_medium_url );
                            } catch(e) {
                                fail();
                            }                            
                        }).error( fail );
                    }, 
                    getImage: function ( id, success, fail ) {
                        $.getJSON('https://api.dailymotion.com/video/'+id+'?fields=thumbnail_url&callback=?', function(data) {
                            try {
                                success( data.thumbnail_url );
                            } catch(e) {
                                fail();
                            }                            
                        }).error( fail );
                    }
                }
            }
        }
    })();
    
/**
 * EvoSlider Constructor
 *
 * @class EvoSlider
 * @constructor
 * @param {Object} element
 * @param {Options} options
 * @return instance
 */    
var EvoSlider = function ( element, options ) {
    var evo = this, 
        source,
        url;
        
    this._options = options ;
    this._frame = $( element );
    this._isExternal = false;
    
    if ( $.isEmptyObject( this._options.external ) ) {
        this.init();
    } else {
        this._isExternal = true;
        this._frame.append('<div class="contentLoader"></div>');       
        this._getExternalData();
    }
    
    return this;
};

/**
 * EvoSlider prototype
 */
EvoSlider.prototype = {
    
    /**
     * Validate options value
     *
     * @method _validateOptions
     * @return instance
     */
    _validateOptions: function() {
        var o = this._options, 
            i;
            
        if (( o.startIndex >= this._length ) || ( o.startIndex < 0 )) {
            o.startIndex = 0;
            this._current = 0;
        }
        
        if ( o.width <= 0 ) {
            o.width = 960;
        }
        
        if ( o.height <= 0 ) {
            o.height = 360;
        }
        
        if ( o.paddingRight < 0 ) {
            o.paddingRight = 0;
        }
        
        if ( o.speed <= 0 ) {
            o.speed = 500;
        }
                
        if ( o.interval <= o.speed ) {
            o.interval = 5000;
        }      
        
        if ( o.mode === "accordion" ) {
            o.directionNav = false;
            o.controlNav = false ;
            o.outerText = false ;
        }
        
        if ( o.lazyLoad ) {
            for ( i = 0; i < this._length; i += 1 ) {
                this._contentLoadArr[i] = false;
            }
        }
        
        if ( "ontouchstart" in window ) {
            this._hasTouch = true;
        }
        
        if ( o.responsive ) {
            this._fluidWidth = o.width / this._frame.parent().width();
            this._fluidHeight = o.height / o.width;
            o.width = this._fluidWidth * this._frame.parent().width();
        }
        
        return this;       
    },
    
    /**
     * Retrieve external data
     *
     * @method _getExternalData
     */
    _getExternalData: function(){
        var dataSource = this._options.external.data,
            evo = this,
            url, param;
            
        this._options.loadStart.call( evo );
                
        switch ( dataSource ) {
            case "xml":
                url = this._options.external.url;
                break;
            case "vimeo":
                switch ( evo._options.external.source ) {
                    case "group":
                        param = 'group/' + this._options.external.groupname + '/videos';
                        break;
                    case "channel":
                        param = 'channel/' + this._options.external.channelname + '/videos';
                        break;
                    case "album":
                        param = 'album/' + this._options.external.album_id + '/videos';
                        break;
                    default:
                        param = this._options.external.username + '/' + this._options.external.source;
                }
                
                url = 'http://vimeo.com/api/v2/' + param + '.json?callback=?';
                break;
            case "dailymotion":                
                switch ( evo._options.external.source ) {
                    case "group":
                        param = "group/" + this._options.external.group_id + "/videos";
                        break;
                    case "channel":
                        param = "channel/" + this._options.external.channel_id + "/videos";
                        break;
                    case "contest":
                        param = "contest/" + this._options.external.contest_id + "/videos";
                        break;
                    case "playlist":
                        param = "playlist/" + this._options.external.playlist_id + "/videos";
                        break;
                    default:
                        param = "user/" + this._options.external.user_id + "/" + evo._options.external.source;
                }
                
                url = "https://api.dailymotion.com/" + param + "?limit=" + this._options.numberSlides + "&fields=id,title,description,url,thumbnail_url,thumbnail_medium_url&callback=?";
                break;
            case "youtube":
                switch ( this._options.external.source ) {
                    case "user":
                        param = "users/" + this._options.external.username + "/uploads?alt=json";
                        break;
                    case "playlist":
                        param = "api/playlists/" + this._options.external.playlist_id + "?v=2&alt=json";
                        break;
                    default:
                        param = "api/videos?q=" + this._options.external.search_term + "&v=2&alt=json-in-script&callback=?";
                }
                
                url = "http://gdata.youtube.com/feeds/" + param + "&max-results=" + this._options.numberSlides;
                break;
            case "dribbble":
                param = (this._options.external.source === "shots") ? "" : "/likes"; 
                url = "http://api.dribbble.com/players/" + this._options.external.username + "/shots" + param + "?per_page=" + this._options.numberSlides + "&callback=?";
                break;
            case "flickr":
                var flickrMethod,
                    extras = "description,url_sq,url_t,url_s,url_q,url_m,url_n,url_z,url_c,url_l",
                    api_key = this._options.external.api_key,
                    id, tag_mode;
                                                
                switch ( this._options.external.source ) {
                    case "user":
                        id = "&user_id=" + this._options.external.user_id;
                        flickrMethod = "flickr.people.getPublicPhotos";
                    
                        if ( this._options.external.tags !== undefined ) {
                            tag_mode = this._options.external.tag_mode || "any";
                            flickrMethod = "flickr.photos.search&tags=" + this._options.external.tags + "&tag_mode=" + tag_mode;
                        }
                        break;
                    case "favorites":
                        id = "&user_id=" + this._options.external.user_id;
                        flickrMethod = "flickr.favorites.getPublicList";
                        break;
                    case "gallery":
                        id = "&gallery_id=" + this._options.external.gallery_id;
                        flickrMethod = "flickr.galleries.getPhotos";
                        break;
                    case "photoset":
                        id = "&photoset_id=" + this._options.external.photoset_id;
                        flickrMethod = "flickr.photosets.getPhotos";
                        break;
                    default:
                        id = "&group_id=" + this._options.external.group_id;
                        flickrMethod = "flickr.groups.pools.getPhotos";
                    
                        if ( this._options.external.tags !== undefined ) {
                            flickrMethod = "flickr.groups.pools.getPhotos&tags=" + this._options.external.tags;
                        }
                }
                
                url = "http://api.flickr.com/services/rest/?method=" + flickrMethod + "&extras=" + extras + "&api_key=" + api_key + id + "&format=json&jsoncallback=?&per_page=" + this._options.numberSlides;
                break;
            case "instagram":
                if ( this._options.external.source === "recent" ) {
                    evo._getInstagramUser();                    
                } else {
                    id = "self";
                }
                
                url = "https://api.instagram.com/v1/users/" + id + "/media/" + this._options.external.source + "/?access_token=" + this._options.external.access_token + "&count=" + this._options.numberSlides + "&callback=?";
                break;
            default:
                if ( this._options.external.source === "recent" ) {
                    param = "?kind=photo";
                    
                    if ( this._options.external.tags !== undefined ) {
                        param = param + "&tag=" + this._options.external.tags;
                    }
                } else {
                    param = "/albumid/" + this._options.external.album_id + "?";
                    
                    if ( this._options.external.tags !== undefined ) {
                        param = param + "tag=" + this._options.external.tags;
                    }
                }               
                
                url = "https://picasaweb.google.com/data/feed/api/user/" + this._options.external.user_id + param + "&v=2&alt=json-in-script&callback=?&imgmax=1024u&max-results=" + this._options.numberSlides;                    
        }
        
        // parse data
        if ( dataSource === "xml" ) {
            Utils.getExternalData( "XML", url, function( data ){
                // success
                evo._parseXml( data );
            }, function(){
                // error
            }, function( jqXHR, textStatus ){
                // complete
                if ( textStatus == "success" ) {
                    evo.init();
                } else if ( textStatus == "error" ) {
                    evo._frame.append( "<p>Error loading content!</p>" );
                }
            } ); 
        } else { 
            Utils.getExternalData( "jsonp", url, function( data ){
                //success
                evo._parseJsonData( data, dataSource );
            }, function(){
                //error
            }, function( jqXHR, textStatus ){
                //complete
                if ( textStatus == "success" ) {
                    evo.init();
                } else if ( textStatus == "error" ) {
                    evo._frame.append( "<p>Error loading content!</p>" );
                }
            } ); 
        }
    },
    
    /**
     * Retrieves Instagram's user recent photos
     *
     * @method _getInstagramUser
     */
    _getInstagramUser: function() {
        var evo = this,
            username = this._options.external.username,
            apiUrl = "https://api.instagram.com/v1/users/",
            url = apiUrl + "search?q=" + username + "&access_token=" + this._options.external.access_token + "&callback=?";
        
        Utils.getExternalData( "jsonp", url, function( data ){
            //success
            $.each(data.data, function(i, item){
                if ( item.username === username ) {
                    
                    url = apiUrl + item.id + "/media/recent/?access_token=" + evo._options.external.access_token + "&count=" + evo._options.numberSlides + "&callback=?";
                                    
                    Utils.getExternalData( "jsonp", url, function( data ){
                        //success
                        evo._parseJsonData( data, "instagram" );
                    }, function(){
                        //error
                    }, function( jqXHR, textStatus ){
                        //complete
                        if ( textStatus == "success" ) {
                            evo.init();
                        } else if ( textStatus == "error" ) {
                            evo._frame.append( "<p>Error loading content!</p>" );
                        }
                    });
                }
            });
        }, function(){
            //error
        }, function( jqXHR, textStatus ){
            //complete                
        });     
    },
    
    /**
     * Parsing XML data and creating html
     * 
     * @method _parseXml
     * @param {Object} xml 
     */
    _parseXml: function(xml) {
        var evo = this,
            dl, title, desc, dataSrc, thumb, url, dataText, scale, caption, readMore;
        
        $("<dl></dl>").appendTo( evo._frame );
        
        dl = evo._frame.find("dl");        
        
        $(xml).find("slide").each( function(i){
            title = $( this ).find("title").text();
            desc = $( this ).find("description").text();
            dataSrc = $( this ).find("image").text();
            thumb = $( this ).find("thumb").text();
            url = $( this ).find("url").text() || "#";
            dataText = $( this ).find("text_mode").text() || evo._options.textMode;
            scale = $( this ).find("image_scale").text() || evo._options.imageScale; 
            
            evo._appendHtml(dl, title, dataSrc, thumb, scale, dataText, url, desc);
            
            //exit
            if ( i === ( evo._options.numberSlides - 1 ) ) {
                return false;
            }
        } );        
    },
    
    /**
     * Parsing JSON data and creating HTML
     *
     * @method _parseJsonData
     * @param {Object} data
     * @param {String} source
     */
    _parseJsonData: function( data, source ) {
        var evo = this,
            dl, title, desc, dataSrc, thumb, url, dataText, scale, caption, 
            photoset_owner, readMore;
        
        $("<dl></dl>").appendTo( evo._frame );
        
        dl = evo._frame.find("dl");
            
        switch ( source ) {
            case "dailymotion":
                data = data["list"];
                break;
            case "vimeo":
                data = data;
                break;
            case "youtube":
                data = data.feed.entry;
                break;
            case "dribbble":
                data = data["shots"];
                break;
            case "flickr":
                if ( this._options.external.photoset_id === undefined ) { 
                    data = data.photos.photo;
                } else {
                    photoset_owner = data.photoset.owner;
                    data = data.photoset.photo;                
                }
                break;
            case "instagram":
                data = data.data;
                break;
            default:
                 data = data.feed.entry;      
        }
    
        $.each(data, function(i, item){
            switch ( source ) {
                case "dailymotion":
                    title = item.title;
                    desc = item.description;
                    dataSrc = item.url;
                    thumb = item.thumbnail_medium_url;
                    url = dataSrc;
                    break;
                case "vimeo":
                    title = item.title;
                    desc = item.description;
                    dataSrc = item.url;
                    thumb = item.thumbnail_medium;
                    url = dataSrc;
                    break;
                case "youtube":
                    title = item.title.$t;
                    desc = item.media$group.media$description.$t;
                    dataSrc = item.link[0].href;
                    thumb = item.media$group.media$thumbnail[0].url;
                    url = dataSrc;
                    break;
                case "dribbble":
                    title = item.title;
                    desc = "";
                    dataSrc = item.image_url;
                    thumb = item.image_teaser_url;
                    url = item.url;          
                    break;
                case "flickr":
                    title = item.title;
                    desc = item.description._content;
                    dataSrc = item.url_l;
                
                    if ( item.url_l == undefined ) {
                        dataSrc = item.url_c;
                        if ( item.url_c == undefined ) {
                            dataSrc = item.url_z;
                            if ( item.url_z == undefined ) {
                                dataSrc = item.url_n;
                                if ( item.url_n == undefined ) {
                                    dataSrc = item.url_m;
                                }
                            }
                        }
                    }
                
                    thumb = item.url_t;
                    url = "http://www.flickr.com/photos/" + (item.owner || photoset_owner) + "/" + item.id;
                    break;
                case "instagram":
                    if ( item.caption == null ) {
                        title = "";
                    } else {
                        title = item.caption.text;
                    }
                    
                    desc = "";
                    dataSrc = item.images.standard_resolution.url;
                    thumb = item.images.thumbnail.url;
                    url = item.link;
                    break;
                default:
                    title = item.title.$t;
                    title = title.substr(0, title.lastIndexOf('.'));
                    desc = item.media$group.media$description.$t;
                    dataSrc = item.media$group.media$content[0].url;
                    thumb = item.media$group.media$thumbnail[1].url;
                    url = item.link[1].href;  
            }      
            
            
            
            if ( title === "" && desc === "" ) {
                dataText = "none";
            } else {
                dataText = evo._options.textMode;
            }
            
            scale = evo._options.imageScale;
            
            evo._appendHtml(dl, title, dataSrc, thumb, scale, dataText, url, desc);
            
            //exit
            if ( i === ( evo._options.numberSlides - 1 ) ) {
                return false;
            }
        });
    },
    
    /**
     * Appends HTML tags
     *
     * @method _appendHtml
     * @param {DOM} dl
     * @param {String} title
     * @param {String} dataSrc
     * @param {String} thumb
     * @param {String} scale
     * @param {String} dataText
     * @param {String} url
     * @param {String} desc
     */
    _appendHtml: function(dl, title, dataSrc, thumb, scale, dataText, url, desc) {
        var evo = this,
            caption;
                        
        if ( evo._options.external.title_length !== undefined ) {
            if ( title.length > evo._options.external.title_length ) {
                title = title.substr(0, evo._options.external.title_length) + "...";
            }   
        }
            
        if ( evo._options.external.desc_length !== undefined ) {
            if ( desc.length > evo._options.external.desc_length ) {
                desc = desc.substr(0, evo._options.external.desc_length) + "...";
            }
        }
            
        caption = title;
            
        if ( url !== "#" ) {
            caption = evo._options.addLinkToTitle ? ('<a href="' + url + '" target="' + evo._options.linkTarget + '">' + title + '</a>') : title ;
                
            if ( evo._options.showReadMore ) {
                readMore = '<a class="readMore" href="' + url + '" target="' + evo._options.linkTarget + '">' + evo._options.readMoreText + '</a>';
            } else {
                readMore = "";
            }
        }                
        
        $('<dt>' + title + '</dt>').appendTo( dl );      
        $('<dd data-src="' + dataSrc + '" data-thumb="' + thumb + '" data-scale="' + scale + '" data-text="' + dataText + '"' + (url == "#" ? "" : "data-url=" + url + '"') + '> <div class="evoText"> <h3>' + caption + '</h3> <p> ' + desc + ' </p> ' + readMore + '</div> </dd>').appendTo( dl );   
    },
    
    /*
     * Rescaling image
     *
     * @method _rescaleImage
     * @param {Image} img
     * @param {DOM} container
     * @param {Number} index
     */
    _rescaleImage: function( img, container, index ) {
        var w, h, marginLeft, marginRight,
            widthRatio, heightRatio, cw, ch,
            scaleMode, dataScale, z;
        
        w = img.width;
        h = img.height;
        cw = container.width();
        ch = container.height();
                
        widthRatio = cw / w;
        heightRatio = ch / h;
        
        dataScale = this._slides.eq( index ).data("scale");
                
        if ( dataScale !== undefined ) {
            scaleMode = dataScale;
        } else {
            scaleMode = this._options.imageScale;
        }        
        
        if ( scaleMode === "fullSize" ) {
            w = w;
            h = h;           
        } else if ( scaleMode === "fitImage" ) {            
            if ( widthRatio < heightRatio ) {
                if ( widthRatio < 1 ) {
                    w = w * widthRatio;
                    h = h * widthRatio;
                }
            } else if ( widthRatio > heightRatio ) {
                if ( heightRatio < 1 ) {
                    w = w * heightRatio;
                    h = h * heightRatio;
                }
            }             
        } else if ( scaleMode === "fitWidth" ) { 
            if ( widthRatio < 1 ) {
                w = w * widthRatio;
                h = h * widthRatio;
            }                        
        } else if ( scaleMode === "fitHeight" ) {             
            if ( heightRatio < 1 ) {
                w = w * heightRatio;
                h = h * heightRatio;
            } 
        } else {
            return this;
        }
        
        marginLeft = ( cw - w ) / 2;
        marginTop = ( ch - h ) / 2;
        
        if ( this._options.responsive ) {
            w = ((w / cw) * 100);
            h = ((h / ch) * 100); 
            marginLeft = (100 - w) / 2;
        } 
                
        z = this._options.responsive ? "%" : "px";
        
        $( img ).css({"marginLeft": marginLeft + z, "marginTop": marginTop + "px", "width": w + z, "height": h + z});
        
        return this;        
    },
    
    /**
     * Returns the width of an element
     *
     * @method _getWidth
     * @param {Number} width
     * @param {DOM} element
     * @param {Boolean} includeMargin
     */
    _getWidth: function( width, element, includeMargin ) {
        return width - ( element.outerWidth( includeMargin ) - element.width() );
    },
    
    /**
     * Returns the width of an element
     *
     * @method _getWidth
     * @param {Number} width
     * @param {DOM} element
     * @param {Boolean} includeMargin
     */
    _getHeight: function( height, element, includeMargin ) {
        return height - ( element.outerHeight( includeMargin ) - element.height() );
    },   
    
    /**
     * Creates frame
     *
     * @method _createFrame
     * @return instance
     */
    _resizeFrame: function( width, height ) {
        var evo = this;       
        
        this._frameInnerWidth = evo._getWidth( width, this._frame, false);
        this._frameInnerHeight = evo._getHeight( height, this._frame, false );
        
        this._frame.css({"width": evo._frameInnerWidth + "px", "height": evo._frameInnerHeight + "px", "overflow": "visible"}); 
        return this;                    
    },
    
    /**
     * Resize dl element
     *
     * @methods _resizeDl
     * @return instance
     */
    _resizeDl: function() {
        var evo = this;        
                        
        this._dlWidth = evo._getWidth( evo._frameInnerWidth, evo._slideContainer, true );
        this._dlHeight = evo._getHeight( evo._frameInnerHeight, evo._slideContainer, true );
        
        this._slideContainer.css({"width": this._dlWidth + "px", "height": this._dlHeight + "px"});
            
        return this;
    },
    
    /**
     * Rotates html element using CSS Transform and IE's Filter
     *
     * @method _rotateElement
     * @param {Object} element HTML element
     * @param {Number} length The length of elements
     * @param {Number} height Height of an html element
     * @param {String} degree Degree of rotation (ie. 10deg)
     * @param {String} origin The origin of transform
     * @param {Number} ierotation Filter rotation value
     * @return instance
     */
    _rotateElement: function( element, length, height, degree, origin, ierotation ) {
        element.css({"-moz-transform": "rotate(" + degree + ") translate(" + height + "px, 0px)", "-moz-transform-origin": origin, 
            "-webkit-transform": "rotate(" + degree + ") translate(" + height + "px, 0px)", "-webkit-transform-origin": origin, 
            "-o-transform": "rotate(" + degree + ") translate(" + height + "px, 0px)", "-o-transform-origin": origin,
            "transform": "rotate(" + degree + ") translate(" + height + "px, 0px)", "transform-origin": origin, 
            "filter": "progid:DXImageTransform.Microsoft.BasicImage(rotation=" + ierotation + ")",
            "-ms-filter": "progid:DXImageTransform.Microsoft.BasicImage(rotation=" + ierotation + ")"});                    
                
        return this;    
    },
    
    /**
     * Retrieves the title bar position
     *
     * @method _getTitlePos
     * @param {Number} index Slide index
     * @param {Number} current Current index
     * @return {Number} Left position of slide
     */
    _getTitlePos: function( index, current ) {
        var titlePos = ( index * this._titleHeight );              
        return index <= current ? titlePos : ( titlePos + this._slideWidth + this._slideSpace + ( this._titleActiveHeight - this._titleHeight ) ); 
    },
    
    /**
     * Retrieves the slide position
     *
     * @method _getSlidePos
     * @param {Number} index Slide Index
     * @param {Number} current Current index
     * @return {Number} Slide left position
     */
    _getSlidePos: function( index, current ) {
        var pos = 0;
        
        if ( this._options.mode === "accordion" ) {
            var slidePos = this._getTitlePos( index, current ) + this._titleHeight;
                        
            if ( index !== current ) {
                pos = index > 0 ? slidePos : this._titleHeight;
            } else {                
                pos = slidePos + ( this._titleActiveHeight - this._titleHeight );
            }
        } else if ( this._options.mode === "scroller" ) {
            pos = ( index * this._slideWidth ) - ( current * this._slideWidth );
        }         
        
        return pos;
    }, 
    
    /*
     * Creates slider
     *
     * @method _createSlider
     * @return instance
     */
    _createSlider: function() {
        var evo = this,
            i, isOpera;
            
        isOpera = $.browser.opera ? true : false;
                    
        this._slideSpace = this._options.slideSpace;        
        this._slideHeight = this._dlHeight ;
                
        if ( this._options.mode === "accordion" ) {    
            this._titleHeight = this._titles.height();
            
            if ( isOpera && evo._options.toggleIcon ) {
                this._createToggleIcon();
            }
            
            this._setAccordionActiveState( this._current );            
            
            if ( evo._options.hideCurrentTitle ) {
                this._titles.eq( evo._current ).hide();
                this._titleActiveHeight = 0;
            } 
            else {
                this._titleActiveHeight = this._titles.eq( evo._current ).height();
            }          
                        
            // fix ie       
            if ( $.browser.msie ) {
                if ( $.browser.version != 7 ) {
                    this._titles.append('<div class="ieFix" style="width:' + evo._titleHeight + 'px; height:' + evo._slideHeight + 'px;"><div class="box"></div></div>');                
                }
            }
            
            if ( !isOpera && evo._options.toggleIcon ) {
                this._createToggleIcon();
            }                                   
            
            // attach title click event
            for ( i = 0; i < evo._length; i += 1 ){   
                this._titles.eq( i ).bind("click.es", {evo: evo, index: i}, evo._titleClickHandler);               
            } 
            
            evo._resizeTitle();              
        } else {
            this._titles.hide();
            this._slideSpace = 0;
            this._slideWidth = this._dlWidth ;
            
            if ( this._options.outerText ) {
                this._createOuterText();
            }
            
            if ( this._options.directionNav ) {
                this._createDirectionNav() ;
            }
            
            if ( this._options.controlNav ) {
                this._createControlNav();
            }
        }    
                
        this._resizeSlider();                
        return this;           
    },
    
    /**
     * Resize title bar
     *
     * @method _resizeTitle
     * @return instance
     */
    _resizeTitle: function() {
        var evo = this,
            i, left,
            padLeft = 0, padRight = 0;
        
        this._titleWidth = this._dlHeight ;
        this._slideWidth = this._dlWidth - ( evo._length * this._titleHeight ) - this._slideSpace - ( this._titleActiveHeight - this._titleHeight );
            
        // title padding           
        padLeft = parseInt( this._titles.css("paddingLeft"), 10 );
        padRight = parseInt( this._titles.css("paddingRight"), 10 ); 
                   
        if ( $.browser.msie ) {
            this._titles.find(".ieFix").css({"height": evo._slideHeight + "px"});                
        }
            
        // rotate title bars
        if ( !this._options.titleClockWiseRotation ) {
            this._rotateElement( evo._titles, evo._length, -evo._titleWidth, "-90deg", "left top", 3 );
        }
        else {
            this._rotateElement( evo._titles, evo._length, -evo._titleHeight, "90deg", "left bottom", 1 );
                
            if ( this._titleHeight !== this._titleActiveHeight ) {
                this._rotateElement( evo._titles.eq( evo._current ), evo._length, -( evo._titleActiveHeight ), "90deg", "left bottom", 1 );
            }
        }                    
                       
        // build title bars
        for ( i = 0; i < this._length; i += 1 ){   
            this._titles.eq( i )
                .css({"left": evo._getTitlePos(i, evo._current) + "px", "width": (evo._titleWidth - (padLeft + padRight)) + "px", 
                    "paddingLeft": padLeft + "px", "paddingRight": padRight + "px"});               
        }
        
        return this;   
    },
    
    /**
     * Resize slider
     *
     * @method _resizeSlider
     * @return instance
     */
    _resizeSlider: function() {
        var evo = this,
            left, i;
        
        for ( i = 0; i < this._length; i += 1 ) {   
            this._slides.eq( i ).css({"top": evo._dlPadTop + "px", "left": ( this._options.mode === "slider" ? 0  : ( this._getSlidePos( i, this._current ) ) ) + "px", "width": evo._slideWidth + "px", "height": evo._slideHeight + "px"});
        }
        
        return this;
    },    
    
    /**
     * Sets the title bar active state
     *
     * @method _setAccordionActiveState
     * @param {Number} index
     * @return instance
     */
    _setAccordionActiveState: function( index ) {
        this._titles.removeClass("active").eq( index ).addClass("active");
        return this;      
    },
    
    /**
     * Runs animation
     *
     * @method _animateSlider
     * @param {Number} index The slide index
     * @param {Function} callback Callback function
     * @return instance
     */
    _animateSlider: function( index, callback ) {
        var evo = this,
            i, x, l, l2, before, current;
        
        if ( !$.isFunction(callback) ) {
            callback = false ;
        }      
        
        if ( this._options.mode === "accordion" || this._options.mode === "scroller" ) {
            if ( this._options.mode === "accordion" ) {
                if ( this._options.hideCurrentTitle ) {
                    this._titles.show().eq( index ).hide();  
                } 
            
                if ( this._options.titleClockWiseRotation ) {
                    if ( this._titleHeight !== this._titleActiveHeight ) {
                        this._rotateElement( evo._titles, evo._length, -evo._titleHeight, "90deg", "left bottom", 1 );
                        this._rotateElement( evo._titles.eq( evo._current ), evo._length, -( evo._titleActiveHeight ), "90deg", "left bottom", 1 );
                    }
                }
            
                x = this._titleActiveHeight - this._titleHeight;
                
                before = this._slides.eq( evo._beforeCurrent );
                current = this._slides.eq( evo._current );
                    
                l = parseInt( before.css("left"), 10 ) - x;
                before.css("left", l + "px");
            
                l2 = parseInt( current.css("left"), 10 ) + x;
                current.css("left", l2 + "px");      
            } 
        
            for ( i = 0; i < this._length; i += 1 ){
                if ( this._options.mode === "accordion" ) {
                     this._titles.eq( i ).animate({"left": evo._getTitlePos( i, index ) + "px"}, evo._options.speed, evo._options.easing ); 
                }
                                
                if ( i !== index ) {   
                    this._slides.eq( i ).animate({"left": evo._getSlidePos( i, index ) + "px"}, evo._options.speed, evo._options.easing);                    
                } else {
                    this._slides.eq( i ).animate({"left": evo._getSlidePos( i, index ) + "px"}, evo._options.speed, evo._options.easing, function(){
                        if ( callback ) {
                            callback();
                        }                                             
                    });
                }  
            }       
        } else if ( this._options.mode === "slider" ) {    
            this._slides
                .fadeOut( evo._options.speed )
                .eq( index ).fadeIn( evo._options.speed, evo._options.easing, function(){
                    if ( callback ) {
                        callback();
                    }
                } );           
        } 
        
        return this;        
    },
    
    /**
     * Creates toggle icons (accordion)
     *
     * @method _createToggleIcon
     * @return instance
     */ 
    _createToggleIcon: function() {
        var i, h, origin, deg, ieRotation, ie7, evo = this;
        
        ie7 = ( $.browser.msie && $.browser.version == 7 ) ? true : false;
            
        for ( i = 0; i < this._length; i += 1 ){ 
            if ( !$.browser.msie || ie7 ) {
                this._titles.eq( i ).append('<div class="toggle_icon">' + evo._createIndex( i ) + '</div>');
            } else {
                this._titles.eq( i ).find(".ieFix").append('<div class="toggle_icon ie">' + evo._createIndex( i ) + '</div>');
            }                        
        }
        
        this._toggleIcons = this._titles.find(".toggle_icon");   
        
        h = this._toggleIcons.eq( 0 ).width();
        deg = "90deg";
        origin = "right top";
        ieRotation = 1;
            
        if ( this._options.titleClockWiseRotation ) {
            origin = "left top";
            h = -h ;
            deg = "-90deg";
            ieRotation = 3;
        }            
            
        if ( !$.browser.msie || ie7 ) {
            this._rotateElement( this._toggleIcons, this._length, h, deg, origin, ieRotation );
        }
              
        return this;
    }, 
    
    /**
     * Creates directional navigation (prev/next arrow)
     *
     * @method _createDirectionNav
     * @return instance
     */
    _createDirectionNav: function() {
        var evo = this;
                
        this._arrowPrev = $('<div class="arrow_prev">' + ( this._options.showDirectionText ? this._options.prevText : "" ) + '</div>')
            .bind("click.es", {evo: evo}, evo._prevHandler).appendTo( this._frame );
            
        this._arrowNext = $('<div class="arrow_next">' + ( this._options.showDirectionText ? this._options.nextText : "" ) + '</div>')
            .bind("click.es", {evo: evo}, evo._nextHandler).appendTo( this._frame );
        
        if ( this._options.directionNavAutoHide ) {
            this._arrowNext.hide();
            this._arrowPrev.hide();
        }
        
        if ( !this._options.loop ) {
            this._setDirectionNavState();
        }
        return this;
    },
    
    /**
     * Sets direction navigation state
     *
     * @method _setDirectionNavState
     * @return instance
     */
    _setDirectionNavState: function() {
        if ( this._current === 0 ) {
            this._arrowPrev.addClass("first");
            this._arrowNext.removeClass("last");
        } else if ( this._current === ( this._length - 1 ) ) {
            this._arrowNext.addClass("last");
            this._arrowPrev.removeClass("first");
        } else {
            this._arrowPrev.removeClass("first");
            this._arrowNext.removeClass("last");
        }
                
        return this;
    },
    
    /**
     * next event handler
     *
     * @method _nextHandler
     * @param {Event Object} e
     */
    _nextHandler: function( e ) {
        e.data.evo._stopSlideshow().next();
    },
    
    /**
     * prev event handler
     *
     * @method _prevHandler
     * @param {Event Object} e
     */
    _prevHandler: function( e ) {
        e.data.evo._stopSlideshow().prev();
    },
    
    /**
     * Creates index for the title bar and bullets control
     *
     * @method _createIndex
     * @param {Number} i
     * @return Number or String
     */
    _createIndex: function( i ) {
        var index = "";
            
        if ( this._options.mode === "accordion" || this._options.controlNavMode === "bullets" ) { 
            if ( this._options.showIndex ) {
                if ( this._options.customIndex.length !== this._length ) {
                   index = i + 1;
                } else {
                    index =  this._options.customIndex[i];
                }
            }
        }
        
        return index;
    },
    
    /**
     * Creates control navigation (bullets, thumbnails, rotator)
     *
     * @method _createControlNav
     * @return instance
     */    
    _createControlNav: function() {
        var evo = this,
            i, ul, w, h, controlNavWidth, index, 
            showThumbs = true,
            floatPos = "none",
            margin = evo._options.controlSpace;
        
        // create inside control    
        this._frame.append('<div class="controlNav"><div class="control_wrapper"><ul></ul></div></div>');
        
        this._controlNav = this._frame.children(".controlNav");
        this._controlWrapper = this._controlNav.find(".control_wrapper");
        this._controlUl = this._controlNav.find("ul");
        
        for ( i = 0; i < this._length; i += 1 ) {                    
            $('<li class="' + this._options.controlNavMode + '">' + this._createIndex( i ) + "</li>")
                .bind("click.es", {evo: evo, index: i}, evo._titleClickHandler)
                .appendTo( this._controlUl );
        }       
        
        this._controlItems = this._controlUl.find("li");
        this._controlItems.eq( this._length - 1 ).addClass("last");
        
        this._setControlActiveState( this._current );
        
        w = this._controlItems.outerWidth( true );
        h = this._controlItems.outerHeight( true );
        
        if ( !this._options.controlNavVertical ) {
            w = 0;
            for ( i = 0; i < this._length; i += 1 ) {
                w += this._controlItems.eq( i ).outerWidth( true );
            }
        } else {
            h = 0;
            for ( i = 0; i < this._length; i += 1 ) {
                h += this._controlItems.eq( i ).outerHeight( true );
            }
        }      
        
        this._controlUl.css({"width": w + "px", "height": h + "px"});     
               
        // build outside control
        if ( this._options.controlNavPosition === "outside" ) {
            this._controlNav
                .css({"position": "relative", "left": "0", "top": "0", "width": "auto", "height": "auto"})
                .wrapAll('<div class="outer_control"></div>');
            
            this._controlOuter = this._frame.find(".outer_control");
            
            if ( !this._options.controlNavVertical ) {
                this._controlOuter.css({"marginTop": margin + "px", "float": "left"});
            } else {    
                floatPos = this._options.controlNavVerticalAlign === "left" ? "right" : "left";
                
                if ( floatPos === "left" ) {
                    this._controlOuter.css({"marginLeft": margin + "px", "float": floatPos, "width": w + "px"});
                } else {
                    this._controlOuter.css({"marginRight": margin + "px", "float": floatPos, "width": w + "px"});
                }                
                                
                if ( !this._options.outerText ) {
                    this._slideContainer.css("float", floatPos);
                } else {
                    this._slideWrapper.css("float", floatPos);
                } 
            }
            
            this._resizeOuterControl();
        } else {
            evo._controlWrapWidth = evo._controlWrapper.width();
            evo._controlWrapHeight = evo._controlWrapper.height();
        }           
        
        if ( this._options.controlNavMode === "thumbnails" ) {
            this._controlItems.append('<div class="overlay" />');
        }          
        
        if ( this._options.controlNavMode === "rotator" ) {
            if ( !this._options.showRotatorThumbs ) {    
                showThumbs = false;
            }
            
            if ( this._options.showRotatorTitles ) {
                this._createRotatorTitle();
            }     
        }        
        
        if ( this._options.controlNavMode !== "bullets" && showThumbs ) {
            this._loadThumbsImage( 0, evo._length );
        }
        
        if ( this._options.controlNavPosition === "inside" && this._options.controlNavAutoHide ) {
            this._controlNav.hide();
        }     
        
        this._controlMaxLeft = w - evo._controlWrapWidth;
        this._controlMaxTop = h - evo._controlWrapHeight;
        
        // mousemove        
        this._controlWrapper.bind("mousemove.es", function(event){
            if ( evo._options.controlNavVertical && evo._controlMaxTop > 0) {
                evo._controlScrollMove( evo._controlWrapHeight, event.pageY, evo._controlWrapper.offset().top, h, false );
            } else {
                if ( evo._controlMaxLeft > 0 ) {
                    evo._controlScrollMove( evo._controlWrapWidth, event.pageX, evo._controlWrapper.offset().left, w, true );
                }
            } 
        });     
                                             
        // swipe        
        if ( this._hasTouch ) {            
            if ( !this._options.controlNavVertical && this._controlMaxLeft > 0 ) {                    
                this._controlUl
                    .bind("touchstart", {elem: evo}, evo._touchStart)
                    .bind("touchmove", {elem: evo}, evo._controlTouchMove)
                    .bind("touchend", {elem: evo}, evo._controlTouchEnd);
            } else {
                if ( this._controlMaxTop > 0 ) {
                    this._controlUl
                        .bind("touchstart", {elem: evo}, evo._touchVStart)
                        .bind("touchmove", {elem: evo}, evo._controlTouchVMove)
                        .bind("touchend", {elem: evo}, evo._controlTouchEnd);
                }
            }
        }
        
        return this;                    
    },
        
    /**
     * Resize outer control
     * 
     * @method _resizeOuterControl
     * @return instance
     */
    _resizeOuterControl: function() {
        var evo = this, 
            coWidth, coHeight, cnWidth, cnHeight;
        
        if ( !this._options.controlNavVertical ) {
            coWidth = this._getWidth( this._frameInnerWidth, this._controlOuter, true );
            this._controlOuter.width( coWidth );
            
            cnWidth = this._getWidth( coWidth, evo._controlNav, true );
            this._controlNav.width( cnWidth );
                        
            this._controlWrapWidth = cnWidth;
            this._controlWrapper.width( this._controlWrapWidth );
            
            this._frame.css({"height": ( evo._frameInnerHeight + evo._controlOuter.outerHeight( true ) ) + "px"});
        } else {
            coHeight = this._getHeight( this._frameInnerHeight, this._controlOuter, true );
            this._controlOuter.height( coHeight );
            
            cnHeight = this._getHeight( coHeight, this._controlNav, true );
            this._controlNav.height( cnHeight );
                       
            this._controlWrapHeight = cnHeight;
            this._controlWrapper.height( this._controlWrapHeight );
             
            this._frame.css({"width": ( evo._frameInnerWidth + evo._controlOuter.outerWidth( true ) ) + "px"});                        
        }
        
        return this;          
    },
    
    /**
     * Title bar's click event handler
     *
     * @method _titleClickHandler
     * @param {Event Object} e
     */
    _titleClickHandler: function( e ) {            
        e.data.evo._stopSlideshow().show( e.data.index );
    },
    
    /**
     * Stops slideshow on user interaction
     *
     * @method _stopSlideshow
     * @return instance
     */
    _stopSlideshow: function() {             
        if ( this._isPlaying && this._options.pauseOnClick ) {
            this.pause();
        }
        
        return this;
    },
	
	/**
	 * Control touch move event handler
	 *
	 * @method _controlTouchMove
	 * @param {Object} e
	 */
	_controlTouchMove: function( e ) {
	    if ( e.originalEvent.touches.length > 1 ) {
	        return false ;
	    }
	    
	    var evo = e.data.elem;
	    e.preventDefault();	    	        
	    evo._slideCoordX.end = e.originalEvent.touches[0].pageX;
	    	    	        
	    if ( evo._slideCoordX.end < evo._slideCoordX.start ) {
	        // swipe left
	        evo._controlSwipeLeft( evo._slideCoordX.end, evo._slideCoordX.start, evo._controlLeft, evo._controlMaxLeft, true );
	    } else {
	        // swipe right
	        evo._controlSwipeRight( evo._slideCoordX.end, evo._slideCoordX.start, evo._controlLeft, evo._controlMaxLeft, true );
	    } 	    	    
	},
	
	/**
	 * Vertical control touch move event handler
	 *
	 * @method _controlTouchVMove
	 * @param {Object} e
	 */
	_controlTouchVMove: function( e ) {
	    if ( e.originalEvent.touches.length > 1 ) {
	        return false ;
	    }
	    
	    var evo = e.data.elem;
	    e.preventDefault();        
	    evo._slideCoordY.end = e.originalEvent.touches[0].pageY;	    
	    
	    if ( evo._slideCoordY.end < evo._slideCoordY.start ) {
	        // swipe top	        
	        evo._controlSwipeLeft( evo._slideCoordY.end, evo._slideCoordY.start, evo._controlTop, evo._controlMaxTop, false );
	    } else {
	        // swipe bottom
	        evo._controlSwipeRight( evo._slideCoordY.end, evo._slideCoordY.start, evo._controlTop, evo._controlMaxTop, false );
	    }       
	},
	
	/**
	 * Control nav swipe left and top
	 *
	 * @method _controlSwipeLeft
	 * @param {Number} end
	 * @param {Number} start
	 * @param {Number} controlPos
	 * @param {Number} controlMaxPos
	 * @param {Boolean} isHorizontal
	 */
	_controlSwipeLeft: function( end, start, controlPos, controlMaxPos, isHorizontal ) {	    
	    if ( controlPos < controlMaxPos ) {	        	        
	        controlPos += ( start - end );
	            
	        if (controlPos > controlMaxPos) {
	            controlPos = controlMaxPos;
	        }
	            
	        if ( isHorizontal ) {
	            this._controlUl.css("left", -controlPos);
	        } else {
	            this._controlUl.css("top", -controlPos);
	        }	            
	    }	    
	},
	
	/**
	 * Control nav swipe right and bottom
	 *
	 * @method _controlSwipeLeft
	 * @param {Number} end
	 * @param {Number} start
	 * @param {Number} controlPos
	 * @param {Number} controlMaxPos
	 * @param {Boolean} isHorizontal
	 */
	_controlSwipeRight: function( end, start, controlPos, controlMaxPos, isHorizontal ) {
	    controlPos -= ( end - start );
	    
	    if ( controlPos < 0 ) {
	        controlPos = 0;
	    }
	            
	    if ( isHorizontal ) {
	        this._controlUl.css("left", -controlPos);
	    } else {
	        this._controlUl.css("top", -controlPos);
	    }
	},
	
	/**
     * Control touch end event handler
     * 
     * @method _controlTouchEnd
     * @param {Object} e
     */
	_controlTouchEnd: function( e ) {
	    var evo = e.data.elem;
	    evo._slideCoordX.start = evo._slideCoordX.end = 0;
	    evo._slideCoordY.start = evo._slideCoordY.end = 0;
	}, 
    
    /**
     * Creates rotator titles
     *
     * @method _createRotatorTitle
     * @return instance
     */
    _createRotatorTitle: function() {
        var i;
        
        for ( i = 0; i < this._length; i += 1 ) {
            this._controlItems.eq( i ).append( $("<p>" + this._titles.eq( i ).html() + "</p>") );
        }
        
        return this;
    },
    
    /**
     * Sets control navigation active state
     *
     * @method _setControlActiveState
     * @param {Number} index
     * @return instance
     */
    _setControlActiveState: function( index ) {        
        this._controlItems
            .removeClass("active")
            .eq( index ).addClass("active");
        
        return this;
    },
    
    /**
     * Scrolls control on hover
     *
     * @method _controlScrollMove
     * @param {Number} wrapperWidth
     * @param {Number} coord
     * @param {Number} wrapperOffset
     * @param {Number} ulWidth
     * @param {Boolean} isHorizontal
     * @return instance
     */    
    _controlScrollMove: function( wrapperWidth, coord, wrapperOffset, ulWidth, isHorizontal ) {
        var pos = ( coord - wrapperOffset ) * (( ulWidth - wrapperWidth ) / wrapperWidth );
        pos = Math.abs( pos );        
               
        if ( isHorizontal ) {
            this._controlUl.stop( true, false ).animate({"left": - pos + "px"}, "linear");
        } else {
            this._controlUl.stop( true, false ).animate({"top": - pos + "px"}, "linear");
        }
        
        return this;
    },		
    
    /**
     * Playing slideshow
     *
     * @method _play
     * @param {Number} interval Autoplay interval
     * @return instance
     */
    _play: function( interval ) {
        var evo = this;
        
        if ( !this._isPlaying ) {               
            this._isPlaying = true ;
            this.trigger("onplay");
        }
        
        this._isPaused = false ;        
                    
        autoplay = setInterval(function(){                
            evo.next();
            
            if ( !evo._options.loop && evo._current === evo._length - 1 ){
                evo._pause();
                return ;
            }            
        }, interval);
        
        if ( this._options.showPlayButton ) {
            this._setPlayButtonState();
        }
        return this;
    },
    
    /**
     * Pause slideshow for a moment (ie. when animation running)
     * 
     * @method _pause
     * @param {Boolean} isHover 
     * @return instance
     */
    _pause: function( isHover ) {
        clearInterval( autoplay );
        
        if ( !isHover ) {
            this._isPlaying = false ;
            this._isPaused = false ;
            this.trigger("onpause");
        }
        
        if ( this._options.showPlayButton ) {
            this._setPlayButtonState();
        }
        return this;
    },    
    
    /**
     * Creates play/pause button
     *
     * @method _createPlayButton
     * @return instance
     */
    _createPlayButton: function() {
        var evo = this,
            container;
        
        if ( this._options.mode === "accordion" ) {
            container = this._slides;
        } else {
            container = this._frame;
        }
        
        $('<div class="control_autoplay"></div>')
            .appendTo( container )
            .append($('<div class="play_button"></div>').bind("click.es", function(){ 
                evo.play( evo._options.interval );
            }))
            .append($('<div class="pause_button"></div>').bind("click.es", function(){ 
                if ( evo._isPlaying ) {
                    evo.pause();
                }
            }));
        
        this._controlAutoplay = container.find(".control_autoplay");        
        this._playButton = this._controlAutoplay.find(".play_button");
        this._pauseButton = this._controlAutoplay.find(".pause_button");
                
        if ( this._options.mode === "accordion" ) {
            this._controlAutoplay
                .hide()
                .eq( evo._current ).show();
        }
        
        if ( this._options.playButtonAutoHide ) {
            this._controlAutoplay.hide();
        }
        
        if ( this._options.showPlayButton ) {
            this._setPlayButtonState();
        }
        
        return this;                   
    },
    
    /**
     * Sets play button state
     *
     * @method _setPlayButtonState
     * @return instance
     */
    _setPlayButtonState: function() {
        if ( this._isPlaying ) {
            this._pauseButton.show();
            this._playButton.hide();
        } else {
            this._pauseButton.hide();
            this._playButton.show();
        }        
        
        return this;
    },
    
    /**
     * Creates inner text
     *
     * @method _createInnerText
     * @return instance
     */    
    _createInnerText: function() {
        var i, dataText, slide, evoText,
            evo = this;
      
        for ( i = 0; i < this._length; i += 1 ) {
            slide = this._slides.eq( i );
            dataText = slide.data("text");
            
            if ( !dataText ) {
                slide.data("text", evo._options.textMode);
                dataText = slide.data("text");
            }
            
            evoText = slide.find(".evoText").addClass( dataText );
        }        
                
        this._resizeInnerText()._showOverlayText( this._current, 0 );
        return this;
    },
    
    /**
     * Resize inner text
     *
     * @method _resizeInnerText
     * @return instance
     */
    _resizeInnerText: function() {
        var evo = this,
            dataText, slide, evoText;
        
        for ( i = 0; i < this._length; i += 1 ) {
            slide = this._slides.eq( i );
            dataText = slide.data("text");
            evoText = slide.find(".evoText");
                                     
            if ( dataText === "partialleft" || dataText === "partialright" ) {
                evoText.css({"height": evo._getHeight( evo._slideHeight, evoText, true ) + "px"});
            }       
        }
        
        return this;             
    },
    
    /**
     * Shows overlay text
     *
     * @method _showOverlayText
     * @param {Number} index
     * @return instance
     */
    _showOverlayText: function( index, delay ) {
        var slide;
        
        if ( !this._options.outerText ) {
            if ( !this._options.autoHideText || this._isHover) {
                this._slides.find(".overlay").fadeOut();
                slide = this._slides.eq( index );
                
                if ( slide.data("text") === "overlay") {
                    slide.find(".evoText").delay( delay ).fadeIn();
                }
            }
        }
        
        return this;
    },
    
    /**
     * Create outer text
     *
     * @method _createOuterText
     * @return instance
     */
    _createOuterText: function() {
        var floatPos,
            marginLeft, marginRight;
        
        this._slides.find(".evoText").hide();
        
        floatPos = this._options.outerTextPosition === "left" ? "right" : "left";
        
        this._slideContainer
            .css("float", floatPos)
            .wrap( $('<div class="slideWrapper"></div>') );
        
        this._slideWrapper = this._frame.find(".slideWrapper");  
        this._outerText = $('<div class="outerText"></div>').appendTo( this._slideWrapper );        
        
        marginLeft = this._options.outerTextPosition === "left" ? ( this._outerText.css("marginLeft") ) : this._options.outerTextSpace;
        marginRight = this._options.outerTextPosition === "left" ? this._options.outerTextSpace : ( this._outerText.css("marginRight") );
                      
        this._outerText.css({"float": floatPos, "marginLeft": marginLeft + "px", "marginRight": marginRight + "px"});
        
        this._resizeOuterText()._insertOuterTextContent();
        
        return this;
    },
    
    /**
     * Resize outer text
     *
     * @method _resizeOuterText
     * @return instance
     */
    _resizeOuterText: function() {
        var evo = this;
        
        this._slideWrapper.css({"width": evo._frameInnerWidth + "px", "height": evo._frameInnerHeight + "px"});                        
        this._outerText.css({"height": evo._getHeight( this._slideWrapper.height(), evo._outerText, true ) + "px"});
        
        this._dlWidth -= this._outerText.outerWidth( true );
        this._slideContainer.width( this._dlWidth );
                          
        this._slideWidth = this._dlWidth;
        
        return this;  
    },
    
    /**
     * Insert outer text content
     *
     * @method _insertOuterTextContent
     * @return instance
     */
    _insertOuterTextContent: function() {
        var i, ul, liContent;
        
        ul = $("<ul></ul>").appendTo( this._outerText );
            
        for ( i = 0; i < this._length; i += 1 ) {
            liContent = this._slides.eq( i ).find(".evoText").html();                        
            ul.append('<li>' + ( liContent === null ? "" : liContent ) + '</li>');
        }
        
        this._outerTextItems = ul.children("li");        
        this._showOuterTextItems( this._current ); 
        
        return this;              
    },
    
    /**
     * Shows outer text item
     *
     * @method _showOuterTextItems
     * @param {Number} index
     * @return instance
     */
    _showOuterTextItems: function( index ) {
        if ( this._options.outerText ) {
            this._outerTextItems
                .fadeOut()
                .eq( index ).fadeIn();    
        }
        
        return this;    
    },
    
    /**
     * Gets file type (image or video)
     *
     * @method _getFileType
     * @param {String} src
     * @return {String} Returns file type
     */    
    _getFileType: function( src ) {
        var pattern, ret;
        
        $.each( Utils.fileTypes, function( i, e ) {
            pattern = e.reg;
            
            if ( pattern.test( src ) ) {
                ret = e.type;                
            }
        });
        
        return ret;
    },
    
    /**
     * Gets file id (image or video)
     *
     * @method _getFileId
     * @param {String} src
     * @return {String} Returns file id
     */    
    _getFileId: function( src ) {
        var id, 
            evo = this,
            match;
        
        for ( var v in Utils.fileTypes ) {
            match = Utils.fileTypes[v].reg;
            
            if ( match.test(src) ) {
                if ( v === "dailymotion" ) {
                    id = src.split( Utils.fileTypes[v].split )[Utils.fileTypes[v].index].split("?")[0].split("&")[0].split("_")[0];
                } else {
                    id = src.split( Utils.fileTypes[v].split )[Utils.fileTypes[v].index].split("?")[0].split("&")[0];
                }               
            }            
        }
        
        return id;        
    },
    
    /**
     * Gets file url
     *
     * @method _getFileUrl
     * @param {String} src
     * @return {String} Returns file url for embed object
     */
    _getFileUrl: function( src ) {
        var ret, id, 
            evo = this,
            match, setting;
            
        id = evo._getFileId( src );
        
        for ( var v in Utils.fileTypes ) {
            match = Utils.fileTypes[v].reg;
            
            if ( match.test(src) ) {
                ret = Utils.fileTypes[v].url.replace("%id%", id);
                
                if ( Utils.fileTypes[v].type === "video" ) {
                    if ( v === "youtube" ) {
                        setting = evo._options.youtube;
                    } else if ( v === "vimeo") {
                        setting = evo._options.vimeo;
                    } else if ( v === "dailymotion" ) {
                        setting = evo._options.dailymotion;
                    }
                
                    for ( var prop in setting ) {
                        ret = ret + "&amp;" + prop + "=" + setting[prop];
                    }                    
                }
            }            
        }
        
        return ret;
    },
    
    /**
     * Gets type of content (html or image)
     *
     * @method _getContentType
     * @param {Number} index
     * @return {String} Returns the type of content 
     */
    _getContentType: function( index ) {
        var ret,
            dataSource = this._slides.eq( index ).data("src");
        
        if ( !dataSource ) {
            ret = "html";
        } else {
            ret = this._getFileType( dataSource );
        }
        
        return ret;        
    },
    
    /**
     * Creates content layout
     *
     * @method _createContent
     * @return instance
     */
    _createContent: function() {
        var i, file, slide, dataText;
        
        for ( i = 0; i < this._length; i += 1 ) {
            slide = this._slides.eq( i );
            dataText = slide.data("text");
            
            file = this._getContentType( i );   
                        
            if ( file === "image" || file === "video" ) {
                if ( dataText === "partialleft" ) {
                    $('<div class="evoImage"></div>').appendTo( this._slides.eq( i ) );
                } else {
                    $('<div class="evoImage"></div>').prependTo( this._slides.eq( i ) );
                }               
            }                           
        }
        
        this._resizeContent(); 
        
        return this;
    },
    
    /**
     * Resize media content
     *
     * @method _resizeContent
     * @return instance
     */
    _resizeContent: function() {
        var slide, i, file, h, w, dataText, evoObject,
            floatPos = "none";        
              
        for ( i = 0; i < this._length; i += 1 ) {
            slide = this._slides.eq( i );
            file = this._getContentType( i );
            dataText = slide.data("text");       
                        
            if ( file === "image" ) {
                evoObject = slide.find(".evoImage");
            } else if ( file === "video" ) {
                evoObject = slide.find(".evoImage");
            } else {
                evoObject = slide.find(".evoEmbed");
                floatPos = dataText === "partialleft" ? "right" : "left";
                evoObject.css({"float": floatPos});
                slide.find(".evoText").css({"float": floatPos});          
            }           
            
            if ( this._options.outerText ) {
                w = this._getWidth( this._slideWidth, evoObject, true );
            } else {
                if ( dataText === "partialleft" || dataText === "partialright" ) {
                    w = this._slideWidth - this._getWidth( slide.find(".evoText").outerWidth( true ), evoObject, true );                    
                } else {
                    w = this._getWidth( this._slideWidth, evoObject, true );
                }
            }
                                
            h = this._getHeight( this._slideHeight, evoObject, true );  
            evoObject.css({"width": w + "px", "height": h + "px"});                      
        }
        
        return this;
    },
    
    /**
     * Loading image
     *
     * @method _loadImage
     * @param {String} src
     * @param {Object} container
     * @param {String} floatPos
     * @param {Boolean} isMainImage
     * @param {Number} index
     * @param {Function} success
     * @param {Function} fail
     * @return instance
     */
    _loadImage: function( src, container, floatPos, isMainImage, index, success, fail ) {
        var img,
            evo = this;
            
        img = new Image();
        img.src = src;       
        
        $( img )
            .bind("load", function () {                
                    
                if ( isMainImage ) {
                    evo._rescaleImage( img, container, index )
                }
                               
                $(this)
                    .css({"display": "none", "float": floatPos})
                    .prependTo(container)
                    .fadeIn("slow", function() {
                        if ( $.isFunction( success ) ) {
                            success();                       
                        }
                    });  
                
            })
            .bind("error", function () {
                if ( $.isFunction( fail ) ) {
                    fail();
                }                
            });
            
        if ( $.browser.msie ) {
            $( img ).attr({"src": src});
        }
        
        return this;        
    },
    
    /**
     * Removes content loader
     *
     * @method _removeContentLoader
     */
    _removeContentLoader: function() {
        var evo = this;
        
        evo._frame.find(".contentLoader").fadeOut( function(){
            $(this).remove();
            evo._options.loadFinish.call( evo );
                            
            if ( evo._options.autoplay ) {
                evo._play( evo._options.interval );
            }   
        } );                        
                
        return this;     
    },
    
    /**
     * Loading video
     *
     * @method _loadVideo
     * @param {String} src
     * @param {Object} container
     * @return instance
     */
    _loadVideo: function( src, container) {
        $('<div class="evoVideo"><iframe width="' + container.width() + 'px" height="' + container.height() + 'px" src="' + src + '" frameborder=0></iframe></div>')
            .hide()
            .fadeIn()
            .appendTo( container );
                
        return this;
    },
    
    /**
     * Loading thumbnails image
     *
     * @method _loadThumbsImage
     * @param {Number} index
     * @param {Number} max
     * @return instance
     */
    _loadThumbsImage: function( index, max) {
        var evo = this, match, id, jsonUrl,
            cont, floatPos, fileUrl, fileType, dataThumb;       
        
        if ( index < max ) {    
            floatPos = this._options.controlNavMode === "rotator" ? this._options.rotatorThumbsAlign : "none";        
            fileUrl = this._slides.eq( index ).data("src");
            fileType = evo._getFileType( fileUrl );
            dataThumb = this._slides.eq( index ).data("thumb"); 
            cont = this._controlItems.eq( index );           
            
            if ( fileType === "video" && !dataThumb ) {
                id = evo._getFileId( fileUrl );
        
                for ( var v in Utils.fileTypes ) {
                    match = Utils.fileTypes[v].reg;
            
                    if ( match.test( fileUrl ) ) {
                        Utils.fileTypes[v].getThumb( id, function( thumbUrl ){
                            evo._loadImage( thumbUrl, cont, floatPos, false, index, function() {
                                evo._loadThumbsImage( index + 1, max );
                            }, function() {
                                evo._loadThumbsImage( index + 1, max );
                            }); 
                        }, function(){
                            evo._loadThumbsImage( index + 1, max );
                        });                             
                    }            
                }                                                   
            } else if ( dataThumb == "" ) {
                evo._loadThumbsImage( index + 1, max );
            } else {
                this._loadImage( dataThumb, cont, floatPos, false, index, function() {
                    evo._loadThumbsImage( index + 1, max );
                }, function(){
                    evo._loadThumbsImage( index + 1, max );
                });                           
            }
        }
        
        return this;        
    },
    
    /**
     * Loading contents (image and video)
     *
     * @method _loadContents
     * @param {Number} index
     * @param {Number} max
     * @return instance
     */
    _loadContents: function ( index, max ) {
        var slide, src, cont, fileType, dataLoad, callback, dataUrl, fail, 
            evo = this, match, id;
            
        if ( index >= this._length ) {
            return this;
        }       
         
        if ( index < max ) {
            slide = this._slides.eq( index );        
            src = slide.data("src");
            fileType = this._getFileType( src );
            dataLoad = this._contentLoadArr[index];
            dataUrl = slide.data("url");
            
            callback = function() {                                
                evo._contentLoadArr[index] = true;
                                
                if (fileType === "image" && dataUrl !== undefined) {
                    if ( evo._options.addLinkToImage ) {
                        slide.find(".evoImage").find("img").wrap('<a href="' + dataUrl + '" target="' + evo._options.linkTarget + '"></a>');
                    }
                }                  
                
                // remove preloader
                if ( evo._isExternal && ( index === evo._length - 1 ) ) {
                    evo._removeContentLoader();               
                }
                
                if ( !evo._isExternal && index === 0 ) {
                    // play
                    if ( evo._options.autoplay ) {
                        evo._play( evo._options.interval );
                    }  
                }
                
                evo._loadContents( index + 1, max );                      
            }
            
            fail = function() {
                // remove preloader
                if ( evo._isExternal && ( index === evo._length - 1 ) ) {
                    evo._removeContentLoader();               
                }
                
                if ( !evo._isExternal && index === 0 ) {
                    // play
                    if ( evo._options.autoplay ) {
                        evo._play( evo._options.interval );
                    } 
                }
                
                evo._loadContents( index + 1, max );  
            }
                
            if ( !dataLoad ) {
                if ( fileType === "image" ) {
                    cont = slide.find(".evoImage");  
                                      
                    this._loadImage( src, cont, "none", true, index, function() {
                        callback();
                    }, function() {
                        fail();                     
                    });                            
                } else if ( fileType === "video" ) {
                    id = evo._getFileId( src );
                    cont = slide.find(".evoImage");
                     
                    for ( var v in Utils.fileTypes ) {
                        match = Utils.fileTypes[v].reg;
            
                        if ( match.test( src ) ) {
                            Utils.fileTypes[v].getImage( id, function( imageUrl ){
                                evo._loadImage( imageUrl, cont, "none", true, index, function() {
                                    callback();
                                    $('<div class="videoOverlay">')
                                        .bind("click", function(){
                                            evo.pause();
                                            
                                            if ( slide.data("text") == "overlay" ) {
                                                slide.find(".evoText").fadeOut();
                                            }
                                            
                                            evo._loadVideo( evo._getFileUrl( src ), cont );
                                        })
                                        .hide()
                                        .fadeIn()
                                        .appendTo( cont );
                                }, function(){                        
                                    fail();                                   
                                });  
                            }, function(){                        
                                fail();
                            });                             
                        }            
                    }            
                } else { // html
                        setTimeout( callback, 3000 );
                }
            } else {                        
                this._loadContents( index + 1, max );      
            }  
        }      
        
        return this;
    },
    
    /**
     * Loads slider based on the permalink
     *
     * @method _loadPermalink
     * @return instance
     */
    _loadPermalink: function() {
        var hash, id,
            pattern = /\#es_[0-9]/;
            
        if ( this._options.permalink ) {
            hash = window.location.hash;
            
            if ( hash ) {
                if ( pattern.test( hash ) ) {
                    id = hash.slice( hash.indexOf("_") + 1 );
                    this.show( parseInt(id, 10) );
                }
            }        
        }
        
        return this;
    },
    
    /**
     * Adds hashtag into url
     *
     * @method _addPermalink
     * @return instance
     */
    _addPermalink: function() {
        if ( this._options.permalink ) {
            window.location.hash = "#es_" + this._current;
        }
        return this;
    },   
    
    /**
     * Brings the scope into any callback
     *
     * @method proxy
     * @param {Function} fn The callback to bring the scope into
     * @param {Object} scope Optional scope to bring
     * @return {Function} Return the callback with the slider scope
     */
    _proxy : function( fn, scope ) {        
        if ( !$.isFunction( fn ) ) {
            return function() {};
        }
        
        scope = scope || this;
        
        return function() {
            return fn.apply( scope, Utils.array( arguments ) );
        };
    },
    
    /**
     * Initialize events
     *
     * @method _initEvents
     * @return instance
     */
    _initEvents: function() {
        var evo = this,
            i;
            
        //mousewheel
        if ( this._options.mouse ) {        
            this._slides
                .bind("mousewheel.es", {elem: evo}, evo._mouseScrollSlide)
                .bind("DOMMouseScroll.es", {elem: evo}, evo._mouseScrollSlide);
        }
        
        // keyboard navigation        
        if ( this._options.keyboard ) {
            $( document ).bind("keydown.es", function( e ) {
                if ( e.keyCode === 39 ) {                    
                    evo._stopSlideshow().next();
                    return false ;
                } else if ( e.keyCode === 37 ) { 
                    evo._stopSlideshow().prev();
                    return false ;
                }
            });
        }
                        
        // external link
        this._extBtnNext.bind("click.es", {evo: evo}, evo._nextHandler);       
        this._extBtnPrev.bind("click.es", {evo: evo}, evo._prevHandler);
        
        this._extLink.bind("click.es", function(e){
            evo._stopSlideshow().show( parseInt( $(this).attr("rel"), 10 ) );
        });        
        
                
        // frame mouseenter
        this._frame.bind("mouseenter.es", function(){
            evo._isHover = true;
            
            if ( evo._options.directionNav && evo._options.directionNavAutoHide ) {
                evo._arrowNext.stop( true, true ).fadeIn();
                evo._arrowPrev.stop( true, true ).fadeIn();
            }
            
            if ( evo._options.controlNav && evo._options.controlNavAutoHide ) {
                if ( evo._options.controlNavPosition === "inside" ) {
                    evo._controlNav.stop( true, true ).fadeIn();
                }
            }
            
            if ( evo._isPlaying && evo._options.pauseOnHover ) {
                evo._isPaused = true;
                evo._pause( true );
            }
            
            if ( evo._options.showPlayButton && evo._options.playButtonAutoHide ) {
                if ( evo._options.mode === "accordion" ) {
                    evo._controlAutoplay.eq( evo._current ).stop( true, true ).fadeIn();
                } else {
                    evo._controlAutoplay.stop( true, true ).fadeIn();
                }
            }            
            
            if ( evo._options.autoHideText && !evo._options.outerText ) {
                evo._slides.eq( evo._current ).find(".overlay").stop( true, true ).fadeIn();
            }
        });      
        
        // frame mouseleave
        this._frame.bind("mouseleave.es", function(){
            if ( evo._options.directionNav && evo._options.directionNavAutoHide ) {
                evo._arrowNext.stop( true, true ).fadeOut();
                evo._arrowPrev.stop( true, true ).fadeOut();
            }
            
            if ( evo._options.controlNav && evo._options.controlNavAutoHide ) {
                if ( evo._options.controlNavPosition === "inside" ) {
                    evo._controlNav.stop( true, true ).fadeOut();
                }
            }
            
            if ( evo._isPlaying && evo._options.pauseOnHover ) {
                if ( evo._isPaused ) {
                    evo._play( evo._options.interval );
                }
            }
            
            if ( evo._options.showPlayButton && evo._options.playButtonAutoHide ) {
                evo._controlAutoplay.hide();
            }
            
            evo._isHover = false;
            
            if ( evo._options.autoHideText && !evo._options.outerText ) {
                evo._slides.find(".overlay").stop( true, true ).fadeOut();
            }
        });
        
        // slide swipe
        if ( this._hasTouch && this._options.swipe ) {
            this._slideCoordX = { start: 0, end: 0 };
            this._slideCoordY = { start: 0, end: 0 };
            
			this._slides
			    .bind("touchstart", {elem: evo}, evo._touchStart)
			    .bind("touchmove", {elem: evo}, evo._touchMove)
			    .bind("touchend", {elem: evo}, evo._touchEnd);
		}
		
		$(window).bind("hashchange", function(){
		    evo._loadPermalink();
		});
		
		if ( this._options.responsive ) {
		    $( window ).bind("resize", function(){
		        evo.resize( evo._fluidWidth * evo._frame.parent().width(), evo._options.height );
		    });
		}  
		
		return this;      
    },
    
    /**
     * Mousewheel scroll event handler
     *
     * @method _mouseScrollSlide
     * @param {Object} e
     * @return {Boolean} false
     */
    _mouseScrollSlide: function( e ) {
        var evo = e.data.elem,
            delta = ( typeof e.originalEvent.wheelDelta === "undefined" ) ?  -e.originalEvent.detail : e.originalEvent.wheelDelta;
		       
        delta > 0 ? evo.prev() : evo.next();
        evo._stopSlideshow();
		return false;
    },
    
    /**
     * Touchstart event handler
     * 
     * @method _touchStart
     * @param {Object} e
     */
    _touchStart: function( e ) {
		e.data.elem._slideCoordX.start = e.originalEvent.touches[0].pageX;
		e.data.elem._slideCoordY.start = e.originalEvent.touches[0].pageY; 
	},
	
	/**
     * Touchmove event handler
     * 
     * @method _touchMove
     * @param {Object} e
     */
	_touchMove: function( e ) {
	    if ( e.originalEvent.touches.length > 1 ) {
	        return false ;
	    }
	    
		e.preventDefault();
				
		e.data.elem._slideCoordX.end = e.originalEvent.touches[0].pageX;
		e.data.elem._slideCoordY.end = e.originalEvent.touches[0].pageY;	
	},
	
	/**
     * Touchstart event handler for vertical swipe
     * 
     * @method _touchVStart
     * @param {Object} e
     */
	_touchVStart: function( e ) {
		e.data.elem._slideCoordX.start = e.originalEvent.touches[0].pageX;
		e.data.elem._slideCoordY.start = e.originalEvent.touches[0].pageY; 
	},
	
	/**
     * Touchmove event handler for vertical swipe
     * 
     * @method _touchVMove
     * @param {Object} e
     */
	_touchVMove: function( e ) {
	    if ( e.originalEvent.touches.length > 1 ) {
	        return false ;
	    }
	    
		e.preventDefault();
		
		e.data.elem._slideCoordX.end = e.originalEvent.touches[0].pageX;
		e.data.elem._slideCoordY.end = e.originalEvent.touches[0].pageY;		
	},
	
	/**
     * Touchend event handler
     * 
     * @method _touchEnd
     * @param {Object} e
     */
	_touchEnd: function( e ) {
		var evo = e.data.elem,
		    isHorizontal = false, delta, 
		    axis_threshold = 30; // user will not define a perfect line
		    
	    delta = Math.abs( e.data.elem._slideCoordY.end - e.data.elem._slideCoordY.start );
	    
	    isHorizontal = delta > axis_threshold ? false : true;
	    		    
		evo._isTouch = true;
		
		if ( evo._slideCoordX.end > 0 && isHorizontal ) {
			if ( Math.abs( evo._slideCoordX.start - evo._slideCoordX.end ) > evo.SWIPE_MIN ) {        
				if ( evo._slideCoordX.end < evo._slideCoordX.start ) {
					evo.next();
				} else {
					evo.prev();
				}
			}
			
			evo._stopSlideshow();
		}
		
		evo._slideCoordX.start = evo._slideCoordY.end = 0;
		evo._isTouch = false;
	}, 
    
    /**
     * Build EvoSlider
     *
     * @method init
     */
    init: function() {
        this._slideContainer = this._frame.children("dl");
        this._titles = this._slideContainer.children("dt");
        this._slides = this._slideContainer.children("dd");
    
        this._current = this._options.startIndex;
        this._beforeCurrent;
        this._length = this._titles.length;
        this._isAnimationRunning = false; 
    
        this._frameInnerWidth = 0;
        this._frameInnerHeight = 0;
    
        this._dlWidth = 0;
        this._dlHeight = 0;
    
        this._titleWidth = 0;
        this._titleHeight = 0;
        this._titleActiveHeight = 0;
    
        this._slideWidth = 0;
        this._slideHeight = 0;
        this._slideSpace = 0;
    
        this._slideWrapper;
    
        this._toggleIcons;
    
        this._arrowNext;
        this._arrowPrev;
    
        this._controlNav;
        this._controlWrapper;
        this._controlWrapWidth;
        this._controlWrapHeight;
        this._controlUl;
        this._controlItems;
        this._controlOuter;
        this._controlLeft = 0;
        this._controlMaxLeft;
        this._controlTop = 0;
        this._controlMaxTop;
    
        this._thumbsPreview;
        this._thumbsPreviewItems;
        this._thumbsPreviewItemsContainer;
    
        this._isPlaying = false ;
        this._isPaused = false;
        this._controlAutoplay;
        this._playButton;
        this._pauseButton;
    
        this._evoText;
        this._outerText;
        this._outerTextItems;
        this._isHover = false; 
    
        this.SWIPE_MIN = 50;
        this._slideCoordX = {start: 0, end: 0};
        this._slideCoordY = {start: 0, end: 0};
    
        this._contentLoadArr = [];
    
        this._hasTouch = false;
        this._isTouch = false;
    
        this._extBtnNext = $("." + this._options.classBtnNext);
        this._extBtnPrev = $("." + this._options.classBtnPrev);
        this._extLink = $("." + this._options.classExtLink);
    
        this._fluidWidth = 0;
        this._fluidHeight = 0;
    
            
        this._validateOptions()
            ._resizeFrame( this._options.width, this._options.height )
            ._resizeDl()
            ._createSlider();
        
        if ( !this._options.outerText ) {
            this._createInnerText();
        }
        
        this._createContent()
            ._initEvents();
                        
        this._loadContents( 0, this._length )
                
        if ( this._options.showPlayButton ) {
            this._createPlayButton();
        }       
        
        if ( this._options.mode === "slider" ) {
            this._slides
                .hide()
                .eq( this._current ).show();
        }       
                        
        $(window).trigger("hashchange");                         
    },
    
    /**
     * Shows the current slide (public API)
     * 
     * @method show
     * @param {Number} index
     * @return instance
     */
    show: function( index ) {
        var evo = this;
        
        if ( index === this._current ) {
            return ;
        }
        
        if ( this._isAnimationRunning ) { 
            return ;
        }
       
        this._beforeCurrent = this._current;
        
        this._options.before.call( evo );                      
                
        this._current = index ;
        this._isAnimationRunning = true ;
        
        this.trigger({
            type: "onstart", 
            index: evo._current
        });
        
        if ( this._getContentType( this._beforeCurrent ) === "video" ) {
            this._slides.eq( evo._beforeCurrent ).find(".evoVideo").fadeIn( function(){
                $(this).remove();
            } );
        } 
        
        if ( this._options.mode === "accordion" ) {
            this._setAccordionActiveState( index );
            
            if ( this._options.showPlayButton ) {
                this._controlAutoplay.hide();
            }
        }         
        
        this._showOverlayText( index, evo._options.speed )
            ._showOuterTextItems( index )
            ._addPermalink();    
                
        this._animateSlider( index, function(){
            evo._isAnimationRunning = false ;
            
            if ( evo._options.showPlayButton && evo._options.mode === "accordion" ) {
                if ( !evo._options.playButtonAutoHide || evo._isHover) {
                    evo._controlAutoplay.eq( index ).fadeIn();
                }
            }
            
            evo.trigger({
                type: "onfinish",
                index: evo._current
            });
            
            evo._options.after.call( evo );
        });
        
        if ( this._options.directionNav && !this._options.loop ) {
            this._setDirectionNavState();
        }
        
        if ( this._options.controlNav ) {
            this._setControlActiveState( index );
        }
              
        return this;
    },
    
    /**
     * Resize Evo Slider (Public API)
     *
     * @method resize
     * @param {Number} width
     * @param {Number} height
     * @return instance
     */
    resize: function( width, height ) {        
        // resize frame
        this._resizeFrame( width, height );
        this._resizeDl();
        
        // resize slider                     
        this._slideHeight = this._dlHeight ;
                
        if (this._options.mode === "accordion") {            
            this._resizeTitle();              
        } else {
            this._slideWidth = this._dlWidth ;
            
            if ( this._options.outerText ) {   
                this._resizeOuterText();
            }            
                        
            if ( this._options.controlNav ) {
                if ( this._options.controlNavPosition === "outside" ) {                   
                    this._resizeOuterControl();
                }           
            }
        }               
            
        this._resizeSlider();
        
        if ( !this._options.outerText ) {
            this._resizeInnerText(); 
        }
        
        this._resizeContent();
        
        return this;     
    },   
    
    /**
     * Gets the currently active index (public API)
     *
     * @method getIndex
     * @return Number 
     */
    getIndex: function() {
        return this._current;
    }, 
    
    /**
     * Gets length of slides
     *
     * @method getLength
     * @return Number
     */
    getLength: function() {
        return this._length;
    },
    
    /**
     * Gets the next index (public API)
     *
     * @method getNext
     * @return Number
     */
    getNext: function() {
        var base = this._current;             
        return base === ( this._length - 1 ) ? 0 : ( base + 1 ); 
    },
    
    /**
     * Gets the previous index (public API)
     * 
     * @method getPrev
     * @return Number
     */
    getPrev: function() {
        var base = this._current;
        return base === 0 ? ( this._length - 1 ) : ( base - 1 );
    },
    
    /**
     * Shows the next slide (public API)
     *
     * @method next
     * @return instance
     */
    next: function() {
        if ( !this._options.loop || this._isTouch ) {
            if ( this._current === this._length - 1 ) {
                return this;
            }
        }
        
        this.show( this.getNext() );
            
        return this;
    },
    
    /**
     * Shows the previous slide (public API)
     *
     * @method prev
     * @return instance
     */
    prev: function() {
        if ( !this._options.loop || this._isTouch ) {
            if ( this._current === 0 ) {
                return this;
            }
        } 
        
        this.show( this.getPrev() );
            
        return this;
    },
    
    /**
     * Sets options value (public API)
     * 
     * @method setOptions 
     * @param {String} key The option name
     * @param {String} value The option value
     * @returns Instance
     *
     * @example setOptions("autoplay", true )
     * @example setOptions({autoplay: true, interval: 5000})
     */
    setOptions: function( key, value ) {
        if ( typeof key === "object" ) {
            $.extend( this._options, key );
        } 
        else {
            this._options[key] = value;
        }
        
        return this;
    },
    
    /**
     * Retrieves option value (public API)
     * If no key specified it will return all options in an object.
     *
     * @method getOptions
     * @param {String} key The option name
     * @return option or options
     */
    getOptions: function( key ) {
        return typeof key === "undefined" ? this._options : this._options[key];
    },
    
    /**
     * Starts the slideshow and set the interval length in milliseconds,
     * if no interval is given, default (5000 = 5 seconds) is used.
     *
     * @method play
     * @param {Number} interval
     * @return instance
     */
    play: function( interval ) {
        if ( !this._isPlaying ) {        
            interval = typeof interval !== "number" ? this._options.interval : ( interval || this._options.interval ); 
            this._play( interval + this._options.speed );
        }
        return this;
    },
    
    /**
     * Stops the slideshow
     *
     * @method pause
     * @return instance
     */
    pause: function() {
        if ( this._isPlaying ) {
            this._pause( false );
        }
        return this;
    },
    
    /**
     * Stops the slideshow if currently playing, otherwise it start the slideshow
     *
     * @method playToggle
     * @param {Number} interval
     * @return instance
     */
    playToggle: function( interval ) {
        if ( !this._isPlaying ) {
            this.play( interval );
        }
        else {
            this.pause();
        }
        
        return this;
    },
    
    /**
     * Bind any event to EvoSlider
     *
     * @method bind
     * @param {string} type The Event type to listen for
     * @param {Function} fn The function to execute when the event is triggered
     * @example this.bind('play', function() { alert("hello world"); });
     * @return instance
     */
    bind: function( type, fn ) {
        this._frame.bind( type + ".es", this._proxy( fn ) );
        return this;
    },
    
    /**
     * Unbind any event to EvoSlider
     *
     * @method unbind
     * @param {string} type The Event type to forget
     * @return instance
     */
    unbind: function( type ) {
        this._frame.unbind( type + ".es" );
        return this;
    },
    
    /**
     * Manually trigger an EvoSlider event
     *
     * @method trigger
     * @param {string} type The Event to trigger
     * @return instance
     */
    trigger: function( type ) {
        type = typeof type === 'object' ?
            $.extend( type, { scope: this } ) :
            { type: type + ".es", scope: this };
                        
        this._frame.trigger( type );
        return this;
    },
    
    /**
     * Destroy Evo Slider instance
     *
     * @method destroy
     */
    destroy: function() {
        if ( this._options.showPlayButton ) {
            this._playButton.unbind(".es");
            this._pauseButton.unbind(".es");
        }
        
        if ( this._options.directionNav ) {
            this._arrowNext.unbind(".es");
            this._arrowPrev.unbind(".es");
        }
        
        if ( this._options.controlNav ) {
            this._controlItems.unbind(".es");
        }
        
        this._slides.unbind(".es");
        this._titles.unbind(".es");
        this._frame.unbind(".es");
        this._frame.remove();
        delete this._frame;
    }
     
};
 
// End of EvoSlider prototype

/**
 * jQuery plugin initializer
 */
$.fn.evoSlider = function( options ) {
    options = $.extend({}, $.fn.evoSlider.options, options);
        
    var ret = [], i,
        n = this.length;
    
    for ( i = 0; i < n; i += 1 ) {
        if( !this[i].evoSlider ) {
            this[i].evoSlider = new EvoSlider( this[i], options );
        }
        ret.push( this[i].evoSlider );
    }
    
    return ret.length > 1 ? ret : ret[0];
};

// end plugin initializer.

/**
 * Plugin default parameters
 */
$.fn.evoSlider.options = {
    mode: "accordion",                  // Sets slider mode ("accordion", "slider", or "scroller")
    width: 960,                         // The width of slider
    height: 360,                        // The height of slider
    slideSpace: 5,                      // The space between slides
    
    titleClockWiseRotation: false,      // Rotates title bar by clock wise
    hideCurrentTitle: false,            // Hides active title bar
    startIndex: 0,                      // Start index when initialized
    showIndex: true,                    // Displays index in toggle icon and bullets control
    customIndex: [],                    // Adds custom index for title bar and bullets control
    
    mouse: true,                        // Enables mousewheel scroll navigation
    keyboard: true,                     // Enables keyboard navigation (left and right arrows)
    speed: 500,                         // Slide transition speed in ms. (1s = 1000ms)
    easing: "swing",                    // Defines the easing effect mode
    loop: true,                         // Rotate slideshow
    
    autoplay: true,                     // Sets EvoSlider to play slideshow when initialized
    interval: 5000,                     // Slideshow interval time in ms
    pauseOnHover: true,                 // Pause slideshow if mouse over the slide
    pauseOnClick: true,                 // Stop slideshow if playing
    
    showPlayButton: true,               // Shows play/pause button when initialized
    playButtonAutoHide: false,          // Shows play/pause button on hover and hide it when mouseout
    
    toggleIcon: true,                   // Enables toggle icon
        
    directionNav: true,                 // Shows directional navigation when initialized
    directionNavAutoHide: false,        // Shows directional navigation on hover and hide it when mouseout
    showDirectionText: false,           // Shows text on direction navigation
    nextText: "Next",                   // Next button text
    prevText: "Prev",                   // Prev button text
    
    controlNav: true,                   // Enables control navigation
    controlNavMode: "bullets",          // Sets control navigation mode ("bullets", "thumbnails", or "rotator")
    controlNavVertical: false,          // Defines control navigation to display vertically
    controlNavPosition: "inside",       // Sets control navigation position ("inside" or "outside")
    controlNavVerticalAlign: "right",   // Sets position of the vertical control navigation ("left" or "right")
    controlSpace: 5,                    // The space between outside control navigation with slides 
    controlNavAutoHide: false,          // Shows control navigation on mouseover and hide it when mouseout
    
    showRotatorTitles: true,            // Shows rotator titles
    showRotatorThumbs: true,            // Shows rotator thumbnails
    rotatorThumbsAlign: "left",         // Thumbnails float position
    
    classBtnNext: "evo_next",           // The CSS class used for the next button
    classBtnPrev: "evo_prev",           // The CSS class used for the previous button
    classExtLink: "evo_link",           // The CSS class used for the external links
    permalink: false,                   // Enable or disable linking to slides via the url
    
    autoHideText: false,                // Shows overlay text on mouseover and hide it on mouseout    
    outerText: false,                   // Enables outer text
    outerTextPosition: "right",         // Outer text align ("left" or "right")
    outerTextSpace: 5,                  // Space between text and slide
    
    linkTarget: "_blank",               // The target attribute of the image link ("_blank", "_parent", "_self", or "_top")
    
    imageScale: "none",             // Sets image scale option ("fullSize", "fitImage", "fitWidth", "fitHeight", "none"),
    
    before: function(){},               // Callback, triggers before slide transition
    after: function(){},                // Callback, triggers after slide transition
    loadStart: function(){},            // Callback, triggers when start loading external data
    loadFinish: function(){},           // Callback, triggers when finish loading external data 
    
    youtube: {                          // Customize the YouTube player parameters
        autoplay: 1,
        showinfo: 1,
        autohide: 2
    },
    
    vimeo: {                            // Customize the Vimeo player parameters
        title: 1,
        byline: 1,
        portrait: 1,
        autoplay: 1
    },
    
    dailymotion: {                      // Customize the Dailymotion player parameters 
        autoplay: 1,
        logo: 0,
        foreground: "%23F7FFFD",
        background: "%23FFC300",
        highlight: "%23171D1B",
        info: 1
    },
    
    textMode: "overlay",                // Sets text description layout mode (overlay, partialleft, partialright, or none)   
    external: {},                       // Sets external data source
    numberSlides: 5,                    // Sets how many slides you want in your Evo Slider (external data)
    
    addLinkToImage: true,               // Adds link to main image
    addLinkToTitle: true,              // Adds link to title
    showReadMore: false,                 // Shows read more button (external data)
    readMoreText: "Read More",          // Read more button text
    swipe: true                         // Enabled or disabled touchscreen support 
};
// end plugin parameters
 
})( jQuery, window, document );