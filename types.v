module mui

import gg
import gx
import os.font

const (
	null_object={"null":WindowData{str:"null"}}
)

pub type OnEvent=fn(EventDetails, mut Window, voidptr)

pub union WindowData {
pub mut:
	num int
    str string
    clr gx.Color
    bol bool
    fun OnEvent
    img gg.Image
    tbl [][]string
}

pub struct WindowConfig {
pub mut:
	title			string		//= ""
	width			int			= 800
	height			int			= 600
	font			string		= font.default()
    app_data		voidptr
}

pub struct EventDetails{
	event			string		// click, value_change, unclick, keypress
	trigger			string		// mouse_left, mouse_right, mouse_middle, keyboard
	value			string
	target_type		string
	target_id		string
}

pub struct Window {
pub mut:
    objects     	[]map[string]WindowData
    focus       	string
    color_scheme	[]gx.Color
    app_data		voidptr
    gg          	&gg.Context
}

pub struct Widget {
	hidden			bool			//= false
	path			string			//= ""
	text			string			//= ""
	placeholder		string			//= ""
	table			[][]string		= [[""]]
	id				string			//= ""
	link			string			//= ""
	percent			int				//= 0
	value			int				//= 0
	value_max		int				= 10
	value_min		int				//= 0
	step			int				= 1
	checked			bool			//= false
	hider_char		string			= "*"
	selected		int				//= 0
	list			[]string		= [""]
	x				int|string		= "0"
	y				int|string		= "0"
	width			int|string		= "125"
	height			int|string		= "20"
	onchange		OnEvent			= empty_fn
	onclick			OnEvent			= empty_fn
	onunclick		OnEvent			= empty_fn
	link_underline	bool			= true
	background		gx.Color		= gx.Color{r: 127, g: 127, b: 127}
}

pub fn empty_fn(event_details EventDetails, mut app &Window, app_data voidptr){}