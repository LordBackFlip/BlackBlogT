jQuery.tableDnD={currentTable:null,dragObject:null,mouseOffset:null,oldY:0,build:function(a){return this.each(function(){this.tableDnDConfig=jQuery.extend({onDnDid:$(this).attr("id"),onDragStyle:null,onDropStyle:null,onDragClass:"tDnD_whileDrag",onDrop:null,onDragStart:null,scrollAmount:5,serializeRegexp:/[^\-]*$/,serializeParamName:null,dragHandle:null},a||{}),jQuery.tableDnD.makeDraggable(this)}),jQuery(document).bind("mousemove",jQuery.tableDnD.mousemove).bind("mouseup",jQuery.tableDnD.mouseup),this},makeDraggable:function(a){var b=a.tableDnDConfig;if(a.tableDnDConfig.dragHandle){var c=jQuery("td."+a.tableDnDConfig.dragHandle,a);c.each(function(){jQuery(this).mousedown(function(c){return jQuery.tableDnD.dragObject=this.parentNode,jQuery.tableDnD.currentTable=a,jQuery.tableDnD.mouseOffset=jQuery.tableDnD.getMouseOffset(this,c),b.onDragStart&&b.onDragStart(a,this),!1})})}else{var d=jQuery("tr",a);d.each(function(){var c=jQuery(this);c.hasClass("nodrag")||c.mousedown(function(c){return"TD"==c.target.tagName?(jQuery.tableDnD.dragObject=this,jQuery.tableDnD.currentTable=a,jQuery.tableDnD.mouseOffset=jQuery.tableDnD.getMouseOffset(this,c),b.onDragStart&&b.onDragStart(a,this),!1):void 0}).css("cursor","move")})}},updateTables:function(){this.each(function(){this.tableDnDConfig&&jQuery.tableDnD.makeDraggable(this)})},mouseCoords:function(a){return a.pageX||a.pageY?{x:a.pageX,y:a.pageY}:{x:a.clientX+document.body.scrollLeft-document.body.clientLeft,y:a.clientY+document.body.scrollTop-document.body.clientTop}},getMouseOffset:function(a,b){b=b||window.event;var c=this.getPosition(a),d=this.mouseCoords(b);return{x:d.x-c.x,y:d.y-c.y}},getPosition:function(a){var b=0,c=0;for(0==a.offsetHeight&&(a=a.firstChild);a.offsetParent;)b+=a.offsetLeft,c+=a.offsetTop,a=a.offsetParent;return b+=a.offsetLeft,c+=a.offsetTop,{x:b,y:c}},mousemove:function(a){if(null!=jQuery.tableDnD.dragObject){var b=jQuery(jQuery.tableDnD.dragObject),c=jQuery.tableDnD.currentTable.tableDnDConfig,d=jQuery.tableDnD.mouseCoords(a),e=d.y-jQuery.tableDnD.mouseOffset.y,f=window.pageYOffset;if(document.all&&("undefined"!=typeof document.compatMode&&"BackCompat"!=document.compatMode?f=document.documentElement.scrollTop:"undefined"!=typeof document.body&&(f=document.body.scrollTop)),d.y-f<c.scrollAmount)window.scrollBy(0,-c.scrollAmount);else{var g=window.innerHeight?window.innerHeight:document.documentElement.clientHeight?document.documentElement.clientHeight:document.body.clientHeight;g-(d.y-f)<c.scrollAmount&&window.scrollBy(0,c.scrollAmount)}if(e!=jQuery.tableDnD.oldY){var h=e>jQuery.tableDnD.oldY;jQuery.tableDnD.oldY=e,c.onDragClass?b.addClass(c.onDragClass):b.css(c.onDragStyle);var i=jQuery.tableDnD.findDropTargetRow(b,e);i&&(h&&jQuery.tableDnD.dragObject!=i?jQuery.tableDnD.dragObject.parentNode.insertBefore(jQuery.tableDnD.dragObject,i.nextSibling):h||jQuery.tableDnD.dragObject==i||jQuery.tableDnD.dragObject.parentNode.insertBefore(jQuery.tableDnD.dragObject,i))}return!1}},findDropTargetRow:function(a,b){for(var c=jQuery.tableDnD.currentTable.rows,d=0;d<c.length;d++){var e=c[d],f=this.getPosition(e).y,g=parseInt(e.offsetHeight)/2;if(0==e.offsetHeight&&(f=this.getPosition(e.firstChild).y,g=parseInt(e.firstChild.offsetHeight)/2),b>f-g&&b<f+g){if(e==a)return null;var h=jQuery.tableDnD.currentTable.tableDnDConfig;if(h.onAllowDrop)return h.onAllowDrop(a,e)?e:null;var i=jQuery(e).hasClass("nodrop");return i?null:e}}return null},mouseup:function(){if(jQuery.tableDnD.currentTable&&jQuery.tableDnD.dragObject){var b=jQuery.tableDnD.dragObject,c=jQuery.tableDnD.currentTable.tableDnDConfig;c.onDragClass?jQuery(b).removeClass(c.onDragClass):jQuery(b).css(c.onDropStyle),jQuery.tableDnD.dragObject=null,c.onDrop&&c.onDrop(jQuery.tableDnD.currentTable,b),jQuery.tableDnD.currentTable=null}},serialize:function(){if(jQuery.tableDnD.currentTable){var a=jQuery.tableDnD.currentTable.tableDnDConfig;return jQuery.tableDnD.serializeTable(jQuery.tableDnD.currentTable)+"&catid="+a.onDnDid}return"Error: No Table id set, you need to set an id on your table and every row"},serializeTable:function(a){for(var b="",c=a.id,d=a.rows,e=0;e<d.length;e++){b.length>0&&(b+="&");var f=d[e].id;f&&f&&a.tableDnDConfig&&a.tableDnDConfig.serializeRegexp&&(f=f.match(a.tableDnDConfig.serializeRegexp)[0]),b+=c+"[]="+f}return b},serializeTables:function(){var a="";return this.each(function(){a+=jQuery.tableDnD.serializeTable(this)}),a}},jQuery.fn.extend({tableDnD:jQuery.tableDnD.build,tableDnDUpdate:jQuery.tableDnD.updateTables,tableDnDSerialize:jQuery.tableDnD.serializeTables});