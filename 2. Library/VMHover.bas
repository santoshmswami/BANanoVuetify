﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.1
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public Hover As VMElement
	Public ID As String
	Private vue As BANanoVue
	Private BANano As BANano  'ignore
	Private DesignMode As Boolean
	Private Module As Object
End Sub

'initialize the Hover
Public Sub Initialize(v As BANanoVue, sid As String, eventHandler As Object) As VMHover
	ID = sid.tolowercase
	Hover.Initialize(v, ID)
	Hover.SetTag("v-hover")
	DesignMode = False
	Module = eventHandler
	vue = v
	Return Me
End Sub

'get component
Sub ToString As String
	Return Hover.ToString
End Sub

Sub SetVModel(k As String) As VMHover
	Hover.SetVModel(k)
	Return Me
End Sub

Sub SetVIf(vif As Object) As VMHover
	Hover.SetVIf(vif)
	Return Me
End Sub

Sub SetVShow(vif As Object) As VMHover
	Hover.SetVShow(vif)
	Return Me
End Sub

'add to app template
Sub Render
	vue.SetTemplate(ToString)
End Sub

'add a child
Sub AddChild(child As VMElement) As VMHover
	Dim childHTML As String = child.ToString
	Hover.SetText(childHTML)
	Return Me
End Sub

'set text
Sub SetText(t As Object) As VMHover
	Hover.SetText(t)
	Return Me
End Sub

'add to parent
Sub Pop(p As VMElement)
	p.SetText(ToString)
End Sub

'add a class
Sub AddClass(c As String) As VMHover
	Hover.AddClass(c)
	Return Me
End Sub

'set an attribute
Sub SetAttr(attr As Map) As VMHover
	Hover.SetAttr(attr)
	Return Me
End Sub

'set style
Sub SetStyle(sm As Map) As VMHover
	Hover.SetStyle(sm)
	Return Me
End Sub

'add children
Sub AddChildren(children As List)
	For Each childx As VMElement In children
		AddChild(childx)
	Next
End Sub

'set close-delay
Sub SetCloseDelay(varCloseDelay As Object) As VMHover
	Dim pp As String = $"${ID}CloseDelay"$
	vue.SetStateSingle(pp, varCloseDelay)
	Hover.Bind(":close-delay", pp)
	Return Me
End Sub

'set disabled
Sub SetDisabled(varDisabled As Object) As VMHover
	Dim pp As String = $"${ID}Disabled"$
	vue.SetStateSingle(pp, varDisabled)
	Hover.Bind(":disabled", pp)
	Return Me
End Sub

'set open-delay
Sub SetOpenDelay(varOpenDelay As Object) As VMHover
	Dim pp As String = $"${ID}OpenDelay"$
	vue.SetStateSingle(pp, varOpenDelay)
	Hover.Bind(":open-delay", pp)
	Return Me
End Sub

'set value
Sub SetValue(varValue As Object) As VMHover
	Dim pp As String = $"${ID}Value"$
	vue.SetStateSingle(pp, varValue)
	Hover.Bind(":value", pp)
	Return Me
End Sub


'hide the component
Sub Hide As VMHover
	Hover.SetVisible(False)
	Return Me
End Sub

'show the component
Sub Show As VMHover
	Hover.SetVisible(True)
	Return Me
End Sub

'enable the component
Sub Enable As VMHover
	Hover.Enable(True)
	Return Me
End Sub

'disable the component
Sub Disable As VMHover
	Hover.Disable(True)
	Return Me
End Sub


'bind a property to state
Sub Bind(prop As String, stateprop As String) As VMHover
	stateprop = stateprop.ToLowerCase
	SetAttrSingle(prop, stateprop)
	Return Me
End Sub

'add a loose attribute without value
Sub SetAttrLoose(loose As String) As VMHover
	Hover.SetAttrLoose(loose)
	Return Me
End Sub

'apply a theme to an element
Sub UseTheme(themeName As String) As VMHover
	themeName = themeName.ToLowerCase
	Dim themes As Map = vue.themes
	If themes.ContainsKey(themeName) Then
		Dim sclass As String = themes.Get(themeName)
		AddClass(sclass)
	End If
	Return Me
End Sub


'set color intensity
Sub SetColorIntensity(varColor As String, varIntensity As String) As VMHover
	Dim pp As String = $"${ID}Color"$
	Dim scolor As String = $"${varColor} ${varIntensity}"$
	vue.SetStateSingle(pp, scolor)
	Hover.Bind(":color", pp)
	Return Me
End Sub

'remove an attribute
public Sub RemoveAttr(sName As String) As VMHover
	Hover.RemoveAttr(sName)
	Return Me
End Sub

'set padding
Sub SetPaddingAll(p As String) As VMHover
	Hover.SetPaddingAll(p)
	Return Me
End Sub

'set all margins
Sub SetMarginAll(p As String) As VMHover
	Hover.setmarginall(p)
	Return Me
End Sub

'set design mode
Sub SetDesignMode(b As Boolean) As VMHover
	Hover.SetDesignMode(b)
	DesignMode = b
	Return Me
End Sub

'set tab index
Sub SetTabIndex(ti As String) As VMHover
	Hover.SetTabIndex(ti)
	Return Me
End Sub

'The Select name. Similar To HTML5 name attribute.
Sub SetName(varName As Object, bbind As Boolean) As VMHover
	Hover.SetName(varName, bbind)
	Return Me
End Sub

'set single style
Sub SetStyleSingle(prop As String, value As String) As VMHover
	Hover.SetStyleSingle(prop, value)
	Return Me
End Sub

'set single attribute
Sub SetAttrSingle(prop As String, value As String) As VMHover
	Hover.SetAttrSingle(prop, value)
	Return Me
End Sub

'set single style
Sub BindStyleSingle(prop As String, value As String) As VMHover
	Hover.BindStyleSingle(prop, value)
	Return Me
End Sub

Sub SetVElse(vif As String) As VMHover
	Hover.SetVElse(vif)
	Return Me
End Sub

Sub SetVText(vhtml As String) As VMHover
	Hover.SetVText(vhtml)
	Return Me
End Sub

Sub SetVhtml(vhtml As String) As VMHover
	Hover.SetVHtml(vhtml)
	Return Me
End Sub

Sub SetAttributes(attrs As List) As VMHover
	For Each stra As String In attrs
		SetAttrLoose(stra)
	Next
	Return Me
End Sub

'set for
Sub SetVFor(item As String, dataSource As String) As VMHover
	dataSource = dataSource.tolowercase
	item = item.tolowercase
	Dim sline As String = $"${item} in ${dataSource}"$
	SetAttrSingle("v-for", sline)
	Return Me
End Sub

Sub SetKey(k As String) As VMHover
	k = k.tolowercase
	SetAttrSingle(":key", k)
	Return Me
End Sub

Sub BuildModel(mprops As Map, mstyles As Map, lclasses As List, loose As List) As VMHover
Hover.BuildModel(mprops, mstyles, lclasses, loose)
Return Me
End Sub