---Library for UI widget interaction.
---See also UKismetWidgetLibrary
---@class UWidgetLib : UBlueprintFunctionLibrary
UWidgetLib = {}

---Creates a UBackgroundBlur widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UBackgroundBlur
function UWidgetLib.CreateBackgroundBlur(ParentUserWidget, OptionalName) end

---Creates a UGBorder widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGBorder
function UWidgetLib.CreateBorder(ParentUserWidget, OptionalName) end

---Creates a UGButton widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGButton
function UWidgetLib.CreateButton(ParentUserWidget, OptionalName) end

---Creates a button containing an icon. IconId: Icon's AssetName (see Asset View window).
---@param Parent UUserWidget
---@param IconId string
---@param Style? FWidgetColorStyle @[default: ()]
---@return UGButton
function UWidgetLib.CreateButtonWithIcon(Parent, IconId, Style) end

---Creates a button containing a text block.
---@param Parent UUserWidget
---@param Text FEText
---@param Style? FWidgetColorStyle @[default: ()]
---@return UGButton
function UWidgetLib.CreateButtonWithText(Parent, Text, Style) end

---Creates a button containing a text block and an icon. IconId: Icon's AssetName (see Asset View window).
---@param Parent UUserWidget
---@param Text FEText
---@param IconId string
---@param Style? FWidgetColorStyle @[default: ()]
---@return UGButton
function UWidgetLib.CreateButtonWithTextAndIcon(Parent, Text, IconId, Style) end

---Creates a UCanvasPanel widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UCanvasPanel
function UWidgetLib.CreateCanvasPanel(ParentUserWidget, OptionalName) end

---Creates a UGCheckBox widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGCheckBox
function UWidgetLib.CreateCheckBox(ParentUserWidget, OptionalName) end

---Creates a UCircularThrobber widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UCircularThrobber
function UWidgetLib.CreateCircularThrobber(ParentUserWidget, OptionalName) end

---Creates a UGComboBoxKey widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGComboBoxKey
function UWidgetLib.CreateComboBoxKey(ParentUserWidget, OptionalName) end

---Creates a UGComboBoxString widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGComboBoxString
function UWidgetLib.CreateComboBoxString(ParentUserWidget, OptionalName) end

---Creates a UGEditableTextBox widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGEditableTextBox
function UWidgetLib.CreateEditableTextBox(ParentUserWidget, OptionalName) end

---Creates a UGEditableTextBoxMultiLine widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGEditableTextBoxMultiLine
function UWidgetLib.CreateEditableTextBoxML(ParentUserWidget, OptionalName) end

---Creates a UGExpandableArea widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGExpandableArea
function UWidgetLib.CreateExpandableArea(ParentUserWidget, OptionalName) end

---Creates a UGridPanel widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGridPanel
function UWidgetLib.CreateGridPanel(ParentUserWidget, OptionalName) end

---Creates a UGTileView widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGTileView
function UWidgetLib.CreateGTileView(ParentUserWidget, OptionalName) end

---Creates a UHorizontalBox widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UHorizontalBox
function UWidgetLib.CreateHorizontalBox(ParentUserWidget, OptionalName) end

---Creates a UGImage widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGImage
function UWidgetLib.CreateImage(ParentUserWidget, OptionalName) end

---Creates a UGInputKeySelector widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGInputKeySelector
function UWidgetLib.CreateInputKeySelector(ParentUserWidget, OptionalName) end

---Creates a UInvalidationBox widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UInvalidationBox
function UWidgetLib.CreateInvalidationBox(ParentUserWidget, OptionalName) end

---Creates a UGListView widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGListView
function UWidgetLib.CreateListView(ParentUserWidget, OptionalName) end

---Creates a UOverlay widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UOverlay
function UWidgetLib.CreateOverlay(ParentUserWidget, OptionalName) end

---Creates a UGProgressBar widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGProgressBar
function UWidgetLib.CreateProgressBar(ParentUserWidget, OptionalName) end

---Creates a URetainerBox widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return URetainerBox
function UWidgetLib.CreateRetainerBox(ParentUserWidget, OptionalName) end

---Creates a UScaleBox widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UScaleBox
function UWidgetLib.CreateScaleBox(ParentUserWidget, OptionalName) end

---Creates a UGScrollBox widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGScrollBox
function UWidgetLib.CreateScrollBox(ParentUserWidget, OptionalName) end

---Creates a USizeBox widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return USizeBox
function UWidgetLib.CreateSizeBox(ParentUserWidget, OptionalName) end

---Creates a UGSlider widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGSlider
function UWidgetLib.CreateSlider(ParentUserWidget, OptionalName) end

---Creates a USliderSpin widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return USliderSpin
function UWidgetLib.CreateSliderSpin(ParentUserWidget, OptionalName) end

---Creates a USpacer widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return USpacer
function UWidgetLib.CreateSpacer(ParentUserWidget, OptionalName) end

---Creates a UGSpinBox widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGSpinBox
function UWidgetLib.CreateSpinBox(ParentUserWidget, OptionalName) end

---Creates a UGSpinBox_Vector widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGSpinBox_Vector
function UWidgetLib.CreateSpinBoxVector(ParentUserWidget, OptionalName) end

---Creates a UGSpinBox_Vector2 widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGSpinBox_Vector2
function UWidgetLib.CreateSpinBoxVector2(ParentUserWidget, OptionalName) end

---Creates a UGSpinBox_Vector4 widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGSpinBox_Vector4
function UWidgetLib.CreateSpinBoxVector4(ParentUserWidget, OptionalName) end

---Creates a UStackBox widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UStackBox
function UWidgetLib.CreateStackBox(ParentUserWidget, OptionalName) end

---Creates a UGTextBlock widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGTextBlock
function UWidgetLib.CreateTextBlock(ParentUserWidget, OptionalName) end

---Creates a UThrobber widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UThrobber
function UWidgetLib.CreateThrobber(ParentUserWidget, OptionalName) end

---Creates a UToggleBox widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UToggleBox
function UWidgetLib.CreateToggleBox(ParentUserWidget, OptionalName) end

---Creates a UGTreeView widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UGTreeView
function UWidgetLib.CreateTreeView(ParentUserWidget, OptionalName) end

---Creates a UImage widget instance. OptionalName: use if you want a consistent name over game sessions.
---UImage has no widget color style. For creating a stylized version, use CreateImage()
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UImage
function UWidgetLib.CreateUImage(ParentUserWidget, OptionalName) end

---Creates a UUniformGridPanel widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UUniformGridPanel
function UWidgetLib.CreateUniformGridPanel(ParentUserWidget, OptionalName) end

---@param WidgetClass TSubclassOf<UUserWidget>
---@param OptionalName string
---@return UUserWidget
function UWidgetLib.CreateUserWidget(WidgetClass, OptionalName) end

---Creates a UVerticalBox widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UVerticalBox
function UWidgetLib.CreateVerticalBox(ParentUserWidget, OptionalName) end

---Creates a UWidgetSwitcher widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UWidgetSwitcher
function UWidgetLib.CreateWidgetSwitcher(ParentUserWidget, OptionalName) end

---Creates a UWrapBox widget instance. OptionalName: use if you want a consistent name over game sessions.
---@param ParentUserWidget UUserWidget
---@param OptionalName string
---@return UWrapBox
function UWidgetLib.CreateWrapBox(ParentUserWidget, OptionalName) end

---Returns all children of the given UserWidget/UPanelWidget
---@param ParentWidget UWidget
---@param OutChildren TArray<UWidget> @[out]
function UWidgetLib.GetAllChildren(ParentWidget, OutChildren) end

---Returns a top-level child (not recursive) with the given name. Child names can be obtained from the Widget Inspector window. Works for both UWidgets and UUserWidgets.
---@param ParentWidget UWidget
---@param ChildName string
---@return UWidget
function UWidgetLib.GetChildByName(ParentWidget, ChildName) end

---Returns a child at any depth with the given dot-separated path name.
---Example: for a "Window" user widget containing "Image_0" inside "Button_1", the child name would be "Button_1.Image_0" with parent = Window.
---Separator symbol: ".".
---Child names can be obtained from the Widget Inspector window. Works for parents being UWidgets and UUserWidgets.
---@param ParentWidget UWidget
---@param RecursiveChildName string
---@return UWidget
function UWidgetLib.GetChildByName_Recursive(ParentWidget, RecursiveChildName) end

---Allowed symbols: a-z, A-Z, 0-9, -, _
---@param Name string
---@return boolean
function UWidgetLib.IsValidWidgetName(Name) end

