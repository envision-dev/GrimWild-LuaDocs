---@meta
---Library for UI widget interaction.
---See also UKismetWidgetLibrary
---@class UWidgetLib : UBlueprintFunctionLibrary
UWidgetLib = {}

---Creates a UBackgroundBlur widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UBackgroundBlur
function UWidgetLib.CreateBackgroundBlur(ParentUserWidget, OptionalName) end

---Creates a UGBorder widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGBorder
function UWidgetLib.CreateBorder(ParentUserWidget, OptionalName) end

---Creates a UGButton widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
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

---Creates a UCanvasPanel widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UCanvasPanel
function UWidgetLib.CreateCanvasPanel(ParentUserWidget, OptionalName) end

---Creates a UGCheckBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGCheckBox
function UWidgetLib.CreateCheckBox(ParentUserWidget, OptionalName) end

---Creates a UCircularThrobber widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UCircularThrobber
function UWidgetLib.CreateCircularThrobber(ParentUserWidget, OptionalName) end

---Creates a UGComboBoxKey widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGComboBoxKey
function UWidgetLib.CreateComboBoxKey(ParentUserWidget, OptionalName) end

---Creates a UGComboBoxString widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGComboBoxString
function UWidgetLib.CreateComboBoxString(ParentUserWidget, OptionalName) end

---Creates a UGEditableTextBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGEditableTextBox
function UWidgetLib.CreateEditableTextBox(ParentUserWidget, OptionalName) end

---Creates a UGEditableTextBoxMultiLine widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGEditableTextBoxMultiLine
function UWidgetLib.CreateEditableTextBoxML(ParentUserWidget, OptionalName) end

---Creates a UGExpandableArea widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGExpandableArea
function UWidgetLib.CreateExpandableArea(ParentUserWidget, OptionalName) end

---Creates a UGridPanel widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGridPanel
function UWidgetLib.CreateGridPanel(ParentUserWidget, OptionalName) end

---Creates a UGTileView widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGTileView
function UWidgetLib.CreateGTileView(ParentUserWidget, OptionalName) end

---Creates a UHorizontalBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UHorizontalBox
function UWidgetLib.CreateHorizontalBox(ParentUserWidget, OptionalName) end

---Creates a UGImage widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGImage
function UWidgetLib.CreateImage(ParentUserWidget, OptionalName) end

---Creates a UGInputKeySelector widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGInputKeySelector
function UWidgetLib.CreateInputKeySelector(ParentUserWidget, OptionalName) end

---Creates a UInvalidationBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UInvalidationBox
function UWidgetLib.CreateInvalidationBox(ParentUserWidget, OptionalName) end

---Creates a UGListView widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGListView
function UWidgetLib.CreateListView(ParentUserWidget, OptionalName) end

---Creates a UOverlay widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UOverlay
function UWidgetLib.CreateOverlay(ParentUserWidget, OptionalName) end

---Creates a UGProgressBar widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGProgressBar
function UWidgetLib.CreateProgressBar(ParentUserWidget, OptionalName) end

---Creates a URetainerBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return URetainerBox
function UWidgetLib.CreateRetainerBox(ParentUserWidget, OptionalName) end

---Creates a UScaleBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UScaleBox
function UWidgetLib.CreateScaleBox(ParentUserWidget, OptionalName) end

---Creates a UGScrollBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGScrollBox
function UWidgetLib.CreateScrollBox(ParentUserWidget, OptionalName) end

---Creates a USearchBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return USearchBox
function UWidgetLib.CreateSearchBox(ParentUserWidget, OptionalName) end

---Creates a USizeBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return USizeBox
function UWidgetLib.CreateSizeBox(ParentUserWidget, OptionalName) end

---Creates a UGSlider widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGSlider
function UWidgetLib.CreateSlider(ParentUserWidget, OptionalName) end

---Creates a USliderSpin widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return USliderSpin
function UWidgetLib.CreateSliderSpin(ParentUserWidget, OptionalName) end

---Creates a USpacer widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return USpacer
function UWidgetLib.CreateSpacer(ParentUserWidget, OptionalName) end

---Creates a UGSpinBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGSpinBox
function UWidgetLib.CreateSpinBox(ParentUserWidget, OptionalName) end

---Creates a UGSpinBox_Vector widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGSpinBox_Vector
function UWidgetLib.CreateSpinBoxVector(ParentUserWidget, OptionalName) end

---Creates a UGSpinBox_Vector2 widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGSpinBox_Vector2
function UWidgetLib.CreateSpinBoxVector2(ParentUserWidget, OptionalName) end

---Creates a UGSpinBox_Vector4 widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGSpinBox_Vector4
function UWidgetLib.CreateSpinBoxVector4(ParentUserWidget, OptionalName) end

---Creates a UStackBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UStackBox
function UWidgetLib.CreateStackBox(ParentUserWidget, OptionalName) end

---Creates a UGTextBlock widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGTextBlock
function UWidgetLib.CreateTextBlock(ParentUserWidget, OptionalName) end

---Creates a UThrobber widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UThrobber
function UWidgetLib.CreateThrobber(ParentUserWidget, OptionalName) end

---Creates a UToggleBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UToggleBox
function UWidgetLib.CreateToggleBox(ParentUserWidget, OptionalName) end

---Creates a UGTreeView widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UGTreeView
function UWidgetLib.CreateTreeView(ParentUserWidget, OptionalName) end

---Creates a UImage widget instance.
---UImage has no widget color style. For creating a stylized version, use CreateImage()
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions.
---@return UImage
function UWidgetLib.CreateUImage(ParentUserWidget, OptionalName) end

---Creates a UUniformGridPanel widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UUniformGridPanel
function UWidgetLib.CreateUniformGridPanel(ParentUserWidget, OptionalName) end

---@param WidgetClass TSubclassOf<UUserWidget>
---@param OptionalName string
---@return UUserWidget
function UWidgetLib.CreateUserWidget(WidgetClass, OptionalName) end

---Creates a UVerticalBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UVerticalBox
function UWidgetLib.CreateVerticalBox(ParentUserWidget, OptionalName) end

---Creates a UWidgetSwitcher widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UWidgetSwitcher
function UWidgetLib.CreateWidgetSwitcher(ParentUserWidget, OptionalName) end

---Creates a UWrapBox widget instance.
---@param ParentUserWidget UUserWidget
---@param OptionalName? string @[default: ""] use if you want a consistent name over game sessions. */
---@return UWrapBox
function UWidgetLib.CreateWrapBox(ParentUserWidget, OptionalName) end

---Returns all children of the given UserWidget/UPanelWidget
---@param ParentWidget UWidget
---@param OutChildren TArray<UWidget> @[out, modified in place]
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

