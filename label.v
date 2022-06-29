module mui

import gg
import gx

pub fn add_label(mut app &Window, text string, id string, x string|int, y string|int, w string|int, h string|int, hi bool, fg gx.Color, fnclk OnEvent){
    app.objects << {
        "type": WindowData{str:"label"},
        "id":   WindowData{str:id}
        "text": WindowData{str:text},
        "x":    WindowData{num:0},
        "y":    WindowData{num:0},
        "w":    WindowData{num:0},
        "h":    WindowData{num:0},
		"x_raw":WindowData{str: match x{ int{ x.str() } string{ x } } },
		"y_raw":WindowData{str: match y{ int{ y.str() } string{ y } } },
		"w_raw":WindowData{str: match w{ int{ w.str() } string{ w } } },
		"h_raw":WindowData{str: match h{ int{ h.str() } string{ h } } },
        "hi":	WindowData{bol:hi},
        "fg":   WindowData{clr:fg},
        "fnclk":WindowData{fun:fnclk}
    }
}

[unsafe]
fn draw_label(app &Window, object map[string]WindowData){
    unsafe {
        app.gg.draw_text(object["x"].num+object["w"].num/2, object["y"].num+object["h"].num/2, object["text"].str, gx.TextCfg{
            color: object["fg"].clr
            size: 20
            align: .center
            vertical_align: .middle
        })
    }
}