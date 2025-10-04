import { Gtk } from "ags/gtk4"
import { createState } from "ags"

const [showContent, setShowContent] = createState(false)

export default function ToggleRevealer() {
    return (
        <box orientation={Gtk.Orientation.VERTICAL} spacing={10}>
            <button
                label="Click for important !!!"
                onClicked={() => {
                    setShowContent(!showContent.get())
                    print('hi')
                }
                }
            />
            <revealer
                transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
                transitionDuration={250}
                revealChild={showContent}
            >
                <label cssName="Test" label="Mam idel sweaty after 8 hours of teacher work CDS sweat ASMR" />
            </revealer>
            <label label="hello" />
        </box>
    )
}
