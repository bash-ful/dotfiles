import GObject from "gi://GObject";
import Gtk from "gi://Gtk";
import constants from "./constants.js";
import { categories, selected, updateCategory } from "./categories.js";
import GLib from "gi://GLib?version=2.0";
import { execAsync } from "ags/process";


export const CategoryScroll = GObject.registerClass(
    class CategoryScroll extends Gtk.ScrolledWindow {
        private box: Gtk.Box
        currentAnimation: number | null = null
        private overlay: Gtk.Overlay

        constructor() {
            super({
                hexpand: true,
                vexpand: false,
            });

            this.box = new Gtk.Box({
                orientation: Gtk.Orientation.HORIZONTAL,
                css_name: "CategoryBox"
            });

            this.overlay = Gtk.Overlay.new()
            this.overlay.set_child(this.box)
            this.set_child(this.overlay);


            categories.forEach((category, index) => {
                this.box.append(new Gtk.Label({
                    css_name: index % 2 === 0 ? "Entry" : "Entry-2",
                    height_request: constants.CATEGORY_SIZE,
                    width_request: constants.CATEGORY_SIZE,
                    label: category.name,
                }))
            })

        }

        private animateScroll(target: number, duration: number = 200): void {
            if (this.currentAnimation) {
                GLib.source_remove(this.currentAnimation)
                this.currentAnimation = null
            }
            let start = this.hadjustment.get_value()
            const distance = target - start
            const startTime = Date.now()
            const easeOutCubic = (t: number) => 1 - Math.pow(1 - t, 3)
            const step = () => {
                const now = Date.now()
                const t = Math.min((now - startTime) / duration, 1)
                this.hadjustment.set_value(start + distance * easeOutCubic(t))

                if (t >= 1) {
                    this.currentAnimation = null
                    return false
                }
                return true
            }
            this.currentAnimation = GLib.timeout_add(GLib.PRIORITY_DEFAULT, 16, step)
        }

        public scroll(amount: number): void {
            const current = selected.get().categoryIndex
            const check: number = amount + current
            if (check < 0 || check > categories.length - 1) return
            execAsync([
                "paplay",
                `${GLib.getenv("HOME")}/Music/sfx/nav.mp3`
            ])
            updateCategory(check)
            this.animateScroll(constants.CATEGORY_SIZE * check)
        }



    }
)
