-----------------------------------------------------------------------------------------
-- 示範如何撰寫元件拖移功能
-- Author: Zack Lin
-- Time: 2015/3/13
-----------------------------------------------------------------------------------------
_SCREEN = {
	WIDTH = display.viewableContentWidth,
	HEIGHT = display.viewableContentHeight
}

_SCREEN.CENTER = {
	X = display.contentCenterX,
	Y = display.contentCenterY
}

--佈置元件
local image1 = display.newImageRect( "assasin.jpg", 80 , 160 )
image1.x = _SCREEN.CENTER.X
image1.y = _SCREEN.CENTER.Y - 100
--調整半透明度
image1.alpha = 0.5

local image2 = display.newImageRect( "girl.jpg", 80 , 160 )
image2.x = _SCREEN.CENTER.X
image2.y = _SCREEN.CENTER.Y + 100
image2.alpha = 0.5

--函式宣告
local function  touch( e )
	local obj = e.target
	if(e.phase == "began") then
		display.getCurrentStage( ):setFocus( obj )
 		obj.isFocus = true
 		obj.alpha = 1
 		--將該物件起始的位置先儲存起來
 		obj.oldX = obj.x
 		obj.oldY = obj.y
 	elseif(e.phase == "ended" or e.phase == "cancelled") then
 		display.getCurrentStage( ):setFocus( nil )
		obj.isFocus = false
		obj.alpha = 0.5
 	elseif(e.phase == "moved") then
 		--只移動e.x和e.xStart之間的差量
 		local move_x = e.x - e.xStart
 		local move_y = e.y - e.yStart
 		obj.x = obj.oldX + move_x
 		obj.y = obj.oldY + move_y
	end
	return true
end

--在要偵聽的元件上加入偵聽器
image1:addEventListener( "touch", touch )
image2:addEventListener( "touch", touch )