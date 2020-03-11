﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.1
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ListGroup As VMElement
	Public ID As String
	Private vue As BANanoVue
	Private BANano As BANano  'ignore
	Private DesignMode As Boolean
	Private Module As Object
End Sub

'initialize the ListGroup
Public Sub Initialize(v As BANanoVue, sid As String, eventHandler As Object) As VMListGroup
	ID = sid.tolowercase
	ListGroup.Initialize(v, ID)
	ListGroup.SetTag("v-list-group")
	DesignMode = False
	Module = eventHandler
	vue = v
	Return Me
End Sub


Sub SetAttributes(attrs As List) As VMListGroup
	For Each stra As String In attrs
		SetAttrLoose(stra)
	Next
	Return Me
End Sub

Sub SetAttrLoose(loose As String) As VMListGroup
	ListGroup.SetAttrLoose(loose)
	Return Me 
End Sub

'get component
Sub ToString As String
	
	Return ListGroup.ToString
End Sub

Sub SetVModel(k As String) As VMListGroup
	ListGroup.SetVModel(k)
	Return Me
End Sub

Sub SetVIf(vif As Object) As VMListGroup
	ListGroup.SetVIf(vif)
	Return Me
End Sub

Sub SetVElseIf(t As Object) As VMListGroup
	ListGroup.Setvelseif(t)
	Return Me
End Sub

Sub SetVShow(vif As Object) As VMListGroup
	ListGroup.SetVShow(vif)
	Return Me
End Sub

'add to app template
Sub Render
	vue.SetTemplate(ToString)
End Sub

'add a child
Sub AddChild(child As VMElement) As VMListGroup
	Dim childHTML As String = child.ToString
	ListGroup.SetText(childHTML)
	Return Me
End Sub

'set text
Sub SetText(t As Object) As VMListGroup
	ListGroup.SetText(t)
	Return Me
End Sub

'add to parent
Sub Pop(p As VMElement)
	p.SetText(ToString)
End Sub

'add a class
Sub AddClass(c As String) As VMListGroup
	ListGroup.AddClass(c)
	Return Me
End Sub

'set an attribute
Sub SetAttr(attr as map) As VMListGroup
	ListGroup.SetAttr(attr)
	Return Me
End Sub

'set style
Sub SetStyle(sm As Map) As VMListGroup
	ListGroup.SetStyle(sm)
	Return Me
End Sub

'add children
Sub AddChildren(children As List)
	For Each childx As VMElement In children
		AddChild(childx)
	Next
End Sub

'set active-class
Sub SetActiveClass(varActiveClass As Object) As VMListGroup
	Dim pp As String = $"${ID}ActiveClass"$
	vue.SetStateSingle(pp, varActiveClass)
	ListGroup.Bind(":active-class", pp)
	Return Me
End Sub

'set append-icon
Sub SetAppendIcon(varAppendIcon As Object) As VMListGroup
	Dim pp As String = $"${ID}AppendIcon"$
	vue.SetStateSingle(pp, varAppendIcon)
	ListGroup.Bind(":append-icon", pp)
	Return Me
End Sub

'set color
Sub SetColor(varColor As Object) As VMListGroup
	Dim pp As String = $"${ID}Color"$
	vue.SetStateSingle(pp, varColor)
	ListGroup.Bind(":color", pp)
	Return Me
End Sub

'set disabled
Sub SetDisabled(varDisabled As boolean) As VMListGroup
	ListGroup.SetDisabled(varDisabled)
	Return Me
End Sub

'set eager
Sub SetEager(varEager As Object) As VMListGroup
	Dim pp As String = $"${ID}Eager"$
	vue.SetStateSingle(pp, varEager)
	ListGroup.Bind(":eager", pp)
	Return Me
End Sub

'set group
Sub SetGroup(varGroup As Object) As VMListGroup
	Dim pp As String = $"${ID}Group"$
	vue.SetStateSingle(pp, varGroup)
	ListGroup.Bind(":group", pp)
	Return Me
End Sub

'set no-action
Sub SetNoAction(varNoAction As Object) As VMListGroup
	Dim pp As String = $"${ID}NoAction"$
	vue.SetStateSingle(pp, varNoAction)
	ListGroup.Bind(":no-action", pp)
	Return Me
End Sub

'set prepend-icon
Sub SetPrependIcon(varPrependIcon As Object) As VMListGroup
	Dim pp As String = $"${ID}PrependIcon"$
	vue.SetStateSingle(pp, varPrependIcon)
	ListGroup.Bind(":prepend-icon", pp)
	Return Me
End Sub

'set ripple
Sub SetRipple(varRipple As Object) As VMListGroup
	Dim pp As String = $"${ID}Ripple"$
	vue.SetStateSingle(pp, varRipple)
	ListGroup.Bind(":ripple", pp)
	Return Me
End Sub

'set sub-group
Sub SetSubGroup(varSubGroup As Object) As VMListGroup
	Dim pp As String = $"${ID}SubGroup"$
	vue.SetStateSingle(pp, varSubGroup)
	ListGroup.Bind(":sub-group", pp)
	Return Me
End Sub

'set value
Sub SetValue(varValue As Object) As VMListGroup
	Dim pp As String = $"${ID}Value"$
	vue.SetStateSingle(pp, varValue)
	ListGroup.Bind(":value", pp)
	Return Me
End Sub

'
Sub SetSlotActivator(b As Boolean) As VMListGroup    'ignore
	SetAttr(CreateMap("slot": "activator"))
	Return Me
End Sub

'
Sub SetSlotAppendIcon(b As Boolean) As VMListGroup    'ignore
	SetAttr(CreateMap("slot": "append-icon"))
	Return Me
End Sub

'
Sub SetSlotPrependIcon(b As Boolean) As VMListGroup    'ignore
	SetAttr(CreateMap("slot": "prepend-icon"))
	Return Me
End Sub

'
Sub SetOnClick(methodName As String) As VMListGroup
	methodName = methodName.tolowercase
	If SubExists(Module, methodName) = False Then Return Me
	Dim e As BANanoEvent
	Dim cb As BANanoObject = BANano.CallBack(Module, methodName, e)
	SetAttr(CreateMap("v-on:click": methodName))
	'add to methods
	vue.SetCallBack(methodName, cb)
	Return Me
End Sub


Sub Hide As VMListGroup
	ListGroup.SetVisible(False)
	Return Me
End Sub

Sub Show As VMListGroup
	ListGroup.SetVisible(True)
	Return Me
End Sub

Sub Enable As VMListGroup
	ListGroup.Enable(True)
	Return Me
End Sub

Sub Disable As VMListGroup
	ListGroup.Disable(True)
	Return Me
End Sub


'bind a property to state
Sub Bind(prop As String, stateprop As String) As VMListGroup
	stateprop = stateprop.ToLowerCase
	SetAttrSingle(prop, stateprop)
	Return Me
End Sub


public Sub RemoveAttr(sName As String) As VMListGroup
	ListGroup.RemoveAttr(sName)
	Return Me
End Sub

'set padding
Sub SetPaddingAll(p As String) As VMListGroup
	ListGroup.SetPaddingAll(p)
	Return Me
End Sub

Sub SetMarginAll(p As String) As VMListGroup
	ListGroup.setmarginall(p)
	Return Me
End Sub

Sub SetDesignMode(b As Boolean) As VMListGroup
	ListGroup.SetDesignMode(b)
	DesignMode = b
	Return Me
End Sub

Sub SetTabIndex(ti As String) As VMListGroup
	ListGroup.SetTabIndex(ti)
	Return Me
End Sub

'The Select name. Similar To HTML5 name attribute.
Sub SetName(varName As Object, bbind As Boolean) As VMListGroup
	ListGroup.SetName(varName, bbind)
	Return Me
End Sub


Sub SetStyleSingle(prop As String, value As String) As VMListGroup
	ListGroup.SetStyleSingle(prop, value)
	Return Me
End Sub

Sub SetAttrSingle(prop As String, value As String) As VMListGroup
	ListGroup.SetAttrSingle(prop, value)
	Return Me
End Sub


Sub BuildModel(mprops As Map, mstyles As Map, lclasses As List, loose As List) As VMListGroup
ListGroup.BuildModel(mprops, mstyles, lclasses, loose)
Return Me
End Sub