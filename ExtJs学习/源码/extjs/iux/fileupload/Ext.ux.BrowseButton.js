/*
 * EXT Browse Button
 * http://t.wits.sg
 * Hacked from Ext Upload Dialog by Max Bazhenov http://www.max-bazhenov.com/dev/upload-dialog-2.0/index.php

USAGE:
	new Ext.ux.BrowseButton({
		input_name: "uploadfile1",
		text: "Select a new avatar"
	})
	
	new Ext.ux.TBBrowseButton({
		input_name: "uploadfile2",
		text: "Select a new avatar"
	})
*/

// ---------------------------------------------------------------------------------------------- //

/**
 * Ext.ux.UploadDialog namespace.
 */
Ext.namespace('Ext.ux');

/**
 * File upload browse button.
 *
 * @class Ext.ux.BrowseButton
 */ 
Ext.ux.BrowseButton = Ext.extend(Ext.Button, 
{
  input_name : 'file',
  
  input_file : null,
  
  original_handler : null,
  
  original_scope : null,
  
  /**
   * @access private
   */
  initComponent : function()
  {
    Ext.ux.BrowseButton.superclass.initComponent.call(this);
    this.original_handler = this.handler || null;
    this.original_scope = this.scope || window;
    this.handler = null;
    this.scope = null;
  },
  
  /**
   * @access private
   */
  onRender : function(ct, position)
  {
    Ext.ux.BrowseButton.superclass.onRender.call(this, ct, position);
    this.createInputFile();
  },
  
  /**
   * @access private
   */
  createInputFile : function()
  {
     var button_container = this.el.child('.x-btn button');
     button_container.position('relative');
    this.input_file = Ext.DomHelper.append(
      button_container, 
      {
        tag: 'input',
        type: 'file',
        size: 1,
        name: this.input_name || Ext.id(this.el),
        style: 'position: absolute; display: block; border: none; cursor: pointer'
      },
      true
    );
    
    var button_box = button_container.getBox();
    this.input_file.setStyle('font-size', (button_box.width * 0.5) + 'px');

    var input_box = Ext.get(this.el).getBox();
    var adj = {x: 3, y: 3}
    if (Ext.isIE) {
      adj = {x: 0, y: 3}
    }
    
    this.input_file.setLeft(button_box.width - input_box.width + adj.x + 'px');
    this.input_file.setTop(button_box.height - input_box.height + adj.y + 'px');
    this.input_file.setY(input_box.y);
    this.input_file.setX(input_box.x - this.input_file.getBox().width + input_box.width);
    this.input_file.setOpacity(0.0);
        
    if (this.handleMouseEvents) {
      this.input_file.on('mouseover', this.onMouseOver, this);
        this.input_file.on('mousedown', this.onMouseDown, this);
    }
    
    if(this.tooltip){
      if(typeof this.tooltip == 'object'){
        Ext.QuickTips.register(Ext.apply({target: this.input_file}, this.tooltip));
      } 
      else {
        this.input_file.dom[this.tooltipType] = this.tooltip;
        }
      }
    
    this.input_file.on('change', this.onInputFileChange, this);
    this.input_file.on('click', function(e) { e.stopPropagation(); }); 
  },
  
  /**
   * @access public
   */
  detachInputFile : function(no_create)
  {
    var result = this.input_file;
     no_create = no_create || false;
    alert(no_create);
    if (typeof this.tooltip == 'object') {
      Ext.QuickTips.unregister(this.input_file);
     }else {
       this.input_file.dom[this.tooltipType] = null;
    }
    this.input_file.removeAllListeners();
    this.input_file = null;
    if (!no_create) {
       this.createInputFile();
    }
    return result;
  },
  
  /**
   * @access public
   */
  getInputFile : function()
  {
    return this.input_file;
  },
  
  /**
   * @access public
   */
  disable : function()
  {
    Ext.ux.BrowseButton.superclass.disable.call(this);  
    this.input_file.dom.disabled = true;
  },
  
  /**
   * @access public
   */
  enable : function()
  {
    Ext.ux.BrowseButton.superclass.enable.call(this);
    this.input_file.dom.disabled = false;
  },
  
  /**
   * @access public
   */
  destroy : function()
  {
    var input_file = this.detachInputFile(true);
    input_file.remove();
    input_file = null;
    Ext.ux.BrowseButton.superclass.destroy.call(this);      
  },
  
  /**
   * @access private
   */
  onInputFileChange : function()
  {
    if (this.original_handler) {
      this.original_handler.call(this.original_scope, this);
    }
  }  
});

/**
 * Toolbar file upload browse button.
 *
 * @class Ext.ux.TBBrowseButton
 */
Ext.ux.TBBrowseButton = Ext.extend(Ext.ux.BrowseButton, 
{
  hideParent : true,

  onDestroy : function()
  {
    Ext.ux.TBBrowseButton.superclass.onDestroy.call(this);
    if(this.container) {
      this.container.remove();
      }
  }
});