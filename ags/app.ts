import app from "ags/gtk4/app"
import style from "./style.scss"
import ToggleRevealer from "./widget/ToggleRevealer"
import XMB from "./widget/XMB"
import Bar from "./widget/Bar"


app.start({
  css: style,
  main() {

    app.get_monitors().map(XMB)
    app.get_monitors().map(Bar)
  },
})
