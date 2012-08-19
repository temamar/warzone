Ext.define( 'ExtCoffeeTodo.view.TodoPanel',
	extend: 'Ext.grid.Panel'
	alias: 'widget.extcoffeetodo-view-todoPanel'
	requires: [ 'Ext.ux.CheckColumn', 'ExtCoffeeTodo.store.TodoStore' ]
	inject: [ 'todoStore' ]
	controller: 'ExtCoffeeTodo.controller.TodoController'

	layout: 'anchor'
	title: "ExtJS and CoffeeScript Todo List"

	# Grid plugin to allow inline editing.
	cellEditing: Ext.create( 'Ext.grid.plugin.CellEditing',
		clicksToEdit: 1
	)


	initComponent: ->

		Ext.applyIf( @,

			store: @todoStore
			emptyText: "There are no Todos yet."

			columns: [
				header: "Todo Description"
				dataIndex: "description"
				flex: 1 #Lets column width adapt to grid width
				editor:
					emptyText: "Enter Todo Description"
					allowBlank: false
			,
				text: 'Created'
				dataIndex: 'dateCreated'
				xtype: 'datecolumn'
				format:'m-d-Y g:i A'
				width: 150
			,
				xtype: "checkcolumn"
				itemId: "completeColumn"
				header: "Complete"
				dataIndex: "complete"
				width: 80
			]

			selModel:
				selType: "cellmodel"

			frame: true

			tbar: [
				text: "Add Todo"
				itemId: "addButton"
				iconCls: "add-icon"
			,
				'->'
			,
				xtype: "checkbox"
				itemId: "showCompletedCheckbox"
				boxLabel: "Show Completed?"
				boxLabelCls: "toolbar-box-label"
			]

			plugins: [
				@cellEditing
			]

		)

		@callParent( arguments )

)