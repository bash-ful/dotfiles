import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { createPoll } from "ags/time"
import { CategoryScroll } from "./XMB/CategoryScroll"

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const time = createPoll("", 1000, ["date", "+%-d/%-m %-I:%M %p"])
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor
  const categoryScroll = new CategoryScroll();

  return (
    <window
      visible
      cssName="Bar"
      name="bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.NORMAL}
      anchor={TOP | LEFT | RIGHT}
      application={app}
      layer={Astal.Layer.BOTTOM}
    >
      <box cssName="time" halign={Gtk.Align.END}>
        <label label={time} />
      </box>
    </window>
  )
}
