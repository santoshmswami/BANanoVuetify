﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.1
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public Card As VMElement
	Public ID As String
	Private vue As BANanoVue
	Private BANano As BANano  'ignore
	Private DesignMode As Boolean
	Private Module As Object
	Public Title As VMCardTitle
	Public Text As VMCardText
	Public Actions As VMCardActions
	Public IsDialog As Boolean
	Public Container As VMContainer
	Public ToolBar As VMToolBar
	Private lst As List
	Private extra As List
	Public IsTable As Boolean
End Sub

'initialize the Card
Public Sub Initialize(v As BANanoVue, sid As String, eventHandler As Object) As VMCard
	ID = sid.tolowercase
	Card.Initialize(v, ID)
	Card.SetTag("v-card")
	DesignMode = False
	Module = eventHandler
	vue = v
	'
	IsDialog = False
	Title.Initialize(vue, $"${ID}title"$, Module)
	Text.Initialize(vue, $"${ID}text"$, Module)
	Actions.Initialize(vue, $"${ID}actions"$, Module)
	Container.Initialize(vue, $"${ID}cont"$, Module)
	ToolBar.Initialize(vue, $"${ID}bar"$, Module).SetToolBar(True)
	lst.Initialize 
	extra.Initialize 
	IsTable = False
	Return Me
End Sub

'set the row and column position
Sub SetRC(sRow As String, sCol As String) As VMCard
	Card.SetRC(sRow, sCol)
	Return Me
End Sub

'set the offsets for this item
Sub SetDeviceOffsets(OS As String, OM As String,OL As String,OX As String) As VMCard
	Card.SetDeviceOffsets(OS, OM, OL, OX)
	Return Me
End Sub

'set the sizes for this item
Sub SetDeviceSizes(SS As String, SM As String, SL As String, SX As String) As VMCard
	Card.SetDeviceSizes(SS , SM , SL , SX )
	Return Me
End Sub

'set the position: row and column and sizes
Sub SetDevicePositions(srow As String, scell As String, small As String, medium As String, large As String, xlarge As String) As VMCard
	SetRC(srow, scell)
	SetDeviceSizes(small, medium , large , xlarge) 
	Return Me
End Sub

Sub SetAttrLoose(loose As String) As VMCard
	Card.SetAttrLoose(loose)
	Return Me
End Sub

Sub SetAttributes(attrs As List) As VMCard
	For Each stra As String In attrs
		SetAttrLoose(stra)
	Next
	Return Me
End Sub

'apply a theme to an element
Sub UseTheme(themeName As String) As VMCard
	themeName = themeName.ToLowerCase
	Dim themes As Map = vue.themes
	If themes.ContainsKey(themeName) Then
		Dim sclass As String = themes.Get(themeName)
		AddClass(sclass)
	End If
	Return Me
End Sub

'add stuff after the actions
Sub AddExtraContent(scontent As String) As VMCard
	extra.Add(scontent)
	Return Me
End Sub

'add a component to the root of the card
Sub AddComponent(comp As String) As VMCard
	Card.SetText(comp)
	Return Me
End Sub

'set color intensity
Sub SetColorIntensity(varColor As String, varIntensity As String) As VMCard
	Dim pp As String = $"${ID}Color"$
	Dim scolor As String = $"${varColor} ${varIntensity}"$
	vue.SetStateSingle(pp, scolor)
	Card.Bind(":color", pp)
	Return Me
End Sub

'add stuff to the root of the card
Sub AddStuff(stuff As String) As VMCard
	lst.Add(stuff)
	Return Me	
End Sub

Sub ToString As String
	If ToolBar.hasContent Then 
		ToolBar.Pop(Card)
	Else
		Title.Pop(Card)
	End If
	If IsTable = False Then 
		Container.Pop(Text.CardText)
		Text.Pop(Card)
	End If
	For Each strItem As String In lst
		Card.SetText(strItem)
	Next
	If IsDialog Then Card.AddDivider
	If IsTable = False Then 
		Actions.Pop(Card)
		For Each strItem As String In extra
			Card.SetText(strItem)
		Next	
	End If
	Return Card.tostring
End Sub

Sub SetVModel(k As String) As VMCard
	Card.SetVModel(k)
	Return Me
End Sub

Sub SetVIf(vif As Object) As VMCard
	Card.SetVIf(vif)
	Return Me
End Sub

Sub SetVShow(vif As Object) As VMCard
	Card.SetVShow(vif)
	Return Me
End Sub

'add to app template
Sub Render
	vue.SetTemplate(ToString)
End Sub

'add a child
Sub AddChild(child As VMElement) As VMCard
	Dim childHTML As String = child.ToString
	Card.SetText(childHTML)
	Return Me
End Sub

'set text
Sub SetText(t As Object) As VMCard
	Card.SetText(t)
	Return Me
End Sub

'add to parent
Sub Pop(p As VMElement)
	p.SetText(ToString)
End Sub

'add a class
Sub AddClass(c As String) As VMCard
	Card.AddClass(c)
	Return Me
End Sub

'set an attribute
Sub SetAttr(attr As Map) As VMCard
	Card.SetAttr(attr)
	Return Me
End Sub

'set style
Sub SetStyle(sm As Map) As VMCard
	Card.SetStyle(sm)
	Return Me
End Sub

'add children
Sub AddChildren(children As List)
	For Each childx As VMElement In children
		AddChild(childx)
	Next
End Sub

'set active-class
Sub SetActiveClass(varActiveClass As Object) As VMCard
	Dim pp As String = $"${ID}ActiveClass"$
	vue.SetStateSingle(pp, varActiveClass)
	Card.Bind(":active-class", pp)
	Return Me
End Sub

'set append
Sub SetAppend(varAppend As Object) As VMCard
	Dim pp As String = $"${ID}Append"$
	vue.SetStateSingle(pp, varAppend)
	Card.Bind(":append", pp)
	Return Me
End Sub

'set color
Sub SetColor(varColor As Object) As VMCard
	Dim pp As String = $"${ID}Color"$
	vue.SetStateSingle(pp, varColor)
	Card.Bind(":color", pp)
	Return Me
End Sub

'set dark
Sub SetDark(varDark As Object) As VMCard
	Dim pp As String = $"${ID}Dark"$
	vue.SetStateSingle(pp, varDark)
	Card.Bind(":dark", pp)
	Return Me
End Sub

'set disabled
Sub SetDisabled(varDisabled As Boolean) As VMCard
	Card.SetDisabled(varDisabled)
	Return Me
End Sub

'set elevation
Sub SetElevation(varElevation As Object) As VMCard
	Dim pp As String = $"${ID}Elevation"$
	vue.SetStateSingle(pp, varElevation)
	Card.Bind(":elevation", pp)
	Return Me
End Sub

'set exact
Sub SetExact(varExact As Object) As VMCard
	Dim pp As String = $"${ID}Exact"$
	vue.SetStateSingle(pp, varExact)
	Card.Bind(":exact", pp)
	Return Me
End Sub

'set exact-active-class
Sub SetExactActiveClass(varExactActiveClass As Object) As VMCard
	Dim pp As String = $"${ID}ExactActiveClass"$
	vue.SetStateSingle(pp, varExactActiveClass)
	Card.Bind(":exact-active-class", pp)
	Return Me
End Sub

'set flat
Sub SetFlat(varFlat As Object) As VMCard
	Dim pp As String = $"${ID}Flat"$
	vue.SetStateSingle(pp, varFlat)
	Card.Bind(":flat", pp)
	Return Me
End Sub

'set height
Sub SetHeight(varHeight As Object) As VMCard
	Dim pp As String = $"${ID}Height"$
	vue.SetStateSingle(pp, varHeight)
	Card.Bind(":height", pp)
	Return Me
End Sub

'set hover
Sub SetHover(varHover As Object) As VMCard
	Dim pp As String = $"${ID}Hover"$
	vue.SetStateSingle(pp, varHover)
	Card.Bind(":hover", pp)
	Return Me
End Sub

'set href
Sub SetHref(varHref As Object) As VMCard
	Dim pp As String = $"${ID}Href"$
	vue.SetStateSingle(pp, varHref)
	Card.Bind(":href", pp)
	Return Me
End Sub

'set img
Sub SetImg(varImg As Object) As VMCard
	Dim pp As String = $"${ID}Img"$
	vue.SetStateSingle(pp, varImg)
	Card.Bind(":img", pp)
	Return Me
End Sub

'set light
Sub SetLight(varLight As Object) As VMCard
	Dim pp As String = $"${ID}Light"$
	vue.SetStateSingle(pp, varLight)
	Card.Bind(":light", pp)
	Return Me
End Sub

'set link
Sub SetLink(varLink As Object) As VMCard
	Dim pp As String = $"${ID}Link"$
	vue.SetStateSingle(pp, varLink)
	Card.Bind(":link", pp)
	Return Me
End Sub

'set loader-height
Sub SetLoaderHeight(varLoaderHeight As Object) As VMCard
	Dim pp As String = $"${ID}LoaderHeight"$
	vue.SetStateSingle(pp, varLoaderHeight)
	Card.Bind(":loader-height", pp)
	Return Me
End Sub

'set loading
Sub SetLoading(varLoading As Object) As VMCard
	Dim pp As String = $"${ID}Loading"$
	vue.SetStateSingle(pp, varLoading)
	Card.Bind(":loading", pp)
	Return Me
End Sub

'set max-height
Sub SetMaxHeight(varMaxHeight As Object) As VMCard
	Dim pp As String = $"${ID}MaxHeight"$
	vue.SetStateSingle(pp, varMaxHeight)
	Card.Bind(":max-height", pp)
	Return Me
End Sub

'set max-width
Sub SetMaxWidth(varMaxWidth As Object) As VMCard
	Dim pp As String = $"${ID}MaxWidth"$
	vue.SetStateSingle(pp, varMaxWidth)
	Card.Bind(":max-width", pp)
	Return Me
End Sub

'set min-height
Sub SetMinHeight(varMinHeight As Object) As VMCard
	Dim pp As String = $"${ID}MinHeight"$
	vue.SetStateSingle(pp, varMinHeight)
	Card.Bind(":min-height", pp)
	Return Me
End Sub

'set min-width
Sub SetMinWidth(varMinWidth As Object) As VMCard
	Dim pp As String = $"${ID}MinWidth"$
	vue.SetStateSingle(pp, varMinWidth)
	Card.Bind(":min-width", pp)
	Return Me
End Sub

'set nuxt
Sub SetNuxt(varNuxt As Object) As VMCard
	Dim pp As String = $"${ID}Nuxt"$
	vue.SetStateSingle(pp, varNuxt)
	Card.Bind(":nuxt", pp)
	Return Me
End Sub

'set outlined
Sub SetOutlined(varOutlined As Object) As VMCard
	Dim pp As String = $"${ID}Outlined"$
	vue.SetStateSingle(pp, varOutlined)
	Card.Bind(":outlined", pp)
	Return Me
End Sub

'set raised
Sub SetRaised(varRaised As Object) As VMCard
	Dim pp As String = $"${ID}Raised"$
	vue.SetStateSingle(pp, varRaised)
	Card.Bind(":raised", pp)
	Return Me
End Sub

'set replace
Sub SetReplace(varReplace As Object) As VMCard
	Dim pp As String = $"${ID}Replace"$
	vue.SetStateSingle(pp, varReplace)
	Card.Bind(":replace", pp)
	Return Me
End Sub

'set ripple
Sub SetRipple(varRipple As Object) As VMCard
	Dim pp As String = $"${ID}Ripple"$
	vue.SetStateSingle(pp, varRipple)
	Card.Bind(":ripple", pp)
	Return Me
End Sub

'set shaped
Sub SetShaped(varShaped As Object) As VMCard
	Dim pp As String = $"${ID}Shaped"$
	vue.SetStateSingle(pp, varShaped)
	Card.Bind(":shaped", pp)
	Return Me
End Sub

'set tag
Sub SetTag(varTag As Object) As VMCard
	Dim pp As String = $"${ID}Tag"$
	vue.SetStateSingle(pp, varTag)
	Card.Bind(":tag", pp)
	Return Me
End Sub

'set target
Sub SetTarget(varTarget As Object) As VMCard
	Dim pp As String = $"${ID}Target"$
	vue.SetStateSingle(pp, varTarget)
	Card.Bind(":target", pp)
	Return Me
End Sub

'set tile
Sub SetTile(varTile As Object) As VMCard
	Dim pp As String = $"${ID}Tile"$
	vue.SetStateSingle(pp, varTile)
	Card.Bind(":tile", pp)
	Return Me
End Sub

'set to
Sub SetTo(varTo As Object) As VMCard
	Dim pp As String = $"${ID}To"$
	vue.SetStateSingle(pp, varTo)
	Card.Bind(":to", pp)
	Return Me
End Sub

'set width
Sub SetWidth(varWidth As Object) As VMCard
	Dim pp As String = $"${ID}Width"$
	vue.SetStateSingle(pp, varWidth)
	Card.Bind(":width", pp)
	Return Me
End Sub

'
Sub SetSlotProgress(b As Boolean) As VMCard    'ignore
	SetAttr(CreateMap("slot": "progress"))
	Return Me
End Sub

'selValue
Sub SetOnClick(methodName As String) As VMCard
	methodName = methodName.tolowercase
	If SubExists(Module, methodName) = False Then Return Me
	Dim e As BANanoEvent
	Dim cb As BANanoObject = BANano.CallBack(Module, methodName, e)
	SetAttr(CreateMap("v-on:click": methodName))
	'add to methods
	vue.SetCallBack(methodName, cb)
	Return Me
End Sub


Sub Hide As VMCard
	Card.SetVisible(False)
	Return Me
End Sub

Sub Show As VMCard
	Card.SetVisible(True)
	Return Me
End Sub

Sub Enable As VMCard
	Card.Enable(True)
	Return Me
End Sub

Sub Disable As VMCard
	Card.Disable(True)
	Return Me
End Sub


'bind a property to state
Sub Bind(prop As String, stateprop As String) As VMCard
	stateprop = stateprop.ToLowerCase
	SetAttrSingle(prop, stateprop)
	Return Me
End Sub


public Sub RemoveAttr(sName As String) As VMCard
	Card.RemoveAttr(sName)
	Return Me
End Sub

'set padding
Sub SetPaddingAll(p As String) As VMCard
	Card.SetPaddingAll(p)
	Return Me
End Sub

Sub SetMarginAll(p As String) As VMCard
	Card.setmarginall(p)
	Return Me
End Sub

Sub SetDesignMode(b As Boolean) As VMCard
	Card.SetDesignMode(b)
	DesignMode = b
	Return Me
End Sub

Sub SetTabIndex(ti As String) As VMCard
	Card.SetTabIndex(ti)
	Return Me
End Sub

'The Select name. Similar To HTML5 name attribute.
Sub SetName(varName As Object, bbind As Boolean) As VMCard
	Card.SetName(varName, bbind)
	Return Me
End Sub


Sub SetStyleSingle(prop As String, value As String) As VMCard
	Card.SetStyleSingle(prop, value)
	Return Me
End Sub

Sub SetAttrSingle(prop As String, value As String) As VMCard
	Card.SetAttrSingle(prop, value)
	Return Me
End Sub

Sub AddToContainer(pCont As VMContainer, rowPos As Int, colPos As Int)
	pCont.AddComponent(rowPos, colPos, ToString)
End Sub

Sub BuildModel(mprops As Map, mstyles As Map, lclasses As List, loose As List) As VMCard
Card.BuildModel(mprops, mstyles, lclasses, loose)
Return Me
End Sub
Sub SetVisible(b As Boolean) As VMCard
Card.SetVisible(b)
Return Me
End Sub

'set color intensity
Sub SetTextColor(varColor As String) As VMCard
	Dim sColor As String = $"${varColor}--text"$
	AddClass(sColor)
	Return Me
End Sub

'set color intensity
Sub SetTextColorIntensity(varColor As String, varIntensity As String) As VMCard
	Dim sColor As String = $"${varColor}--text"$
	Dim sIntensity As String = $"text--${varIntensity}"$
	Dim mcolor As String = $"${sColor} ${sIntensity}"$
	AddClass(mcolor)
	Return Me
End Sub