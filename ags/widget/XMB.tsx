import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { CategoryScroll } from "./XMB/CategoryScroll"
import constants from "./XMB/constants"

export default function XMB(gdkmonitor: Gdk.Monitor) {
    const { LEFT, RIGHT, TOP, BOTTOM } = Astal.WindowAnchor
    const categoryScroll = new CategoryScroll();

    return (
        <window
            visible
            cssName="New"
            name="new"
            gdkmonitor={gdkmonitor}
            exclusivity={Astal.Exclusivity.NORMAL}
            anchor={LEFT | RIGHT | TOP | BOTTOM}
            application={app}
            layer={Astal.Layer.BACKGROUND}
            keymode={Astal.Keymode.ON_DEMAND}
        >
            <Gtk.EventControllerKey
                onKeyPressed={(_, keyval: number) => {
                    if (keyval === Gdk.KEY_Left) {
                        categoryScroll.scroll(-1)
                    }
                    if (keyval === Gdk.KEY_Right) {
                        categoryScroll.scroll(1)

                    }
                    if (keyval === Gdk.KEY_Down) {

                    }
                    if (keyval === Gdk.KEY_Up) {

                    }
                }}
            />

            <box
                heightRequest={constants.CATEGORY_SIZE}
                hexpand={true}
                vexpand={false}
                valign={Gtk.Align.START}
                marginTop={constants.CATEGORY_SIZE * 2}
            >
                {categoryScroll}
            </box>

        </window>
    )
}
