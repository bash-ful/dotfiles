import { createState } from "ags"

export interface Entry {
    name: string
    exec: string | string[]
}

export interface Subcategory {
    name: string
    exec?: string
    entries: Entry[]
}

export interface Category {
    name: string
    subcategories: string[] | Entry[]
}

export interface Selected {
    categoryIndex: number
    subCategoryIndex: number
}

export const categories: Category[] = [
    {
        name: "games",
        subcategories: [
            "game_1",
            "game_2",
            "game_3",
            "game_4",
            "game_5",
        ],
    },
    {
        name: "Settings",
        subcategories: [
            "setting_1",
            "setting_2",
            "setting_3",
            "setting_4",
            "setting_5",
            "setting_6",
        ]
    },
    {
        name: "Dev",
        subcategories: Array.from(Array(2).keys()).map(String),
    },
    {
        name: "Themes",
        subcategories: Array.from(Array(4).keys()).map(String),
    },
    {
        name: "Misc",
        subcategories: Array.from(Array(7).keys()).map(String),
    },
    {
        name: "Apps",
        subcategories: Array.from(Array(5).keys()).map(String),
    },

]

const selectedSubCategoryMap: Map<number, number> = new Map(categories.map((_, index) => [index, 0]))
export let [selected, setSelected] = createState({ categoryIndex: 0, subCategoryIndex: 0 })

export function updateCategory(categoryIndex: number): void {
    if (categoryIndex < 0 || categoryIndex > categories.length - 1) return
    const subCategoryIndex = selectedSubCategoryMap.get(categoryIndex) ?? 0
    setSelected(
        {
            categoryIndex: categoryIndex,
            subCategoryIndex: subCategoryIndex,
        }
    )
}

export function updateSubCategory(subCategoryIndex: number) {
    const categoryIndex = selected.get().categoryIndex
    const subCategoriesLength = categories[categoryIndex].subcategories.length
    if (subCategoryIndex <= 0 || subCategoryIndex >= subCategoriesLength - 1) return
    setSelected(
        {
            categoryIndex: categoryIndex,
            subCategoryIndex: subCategoryIndex,
        }
    )
}