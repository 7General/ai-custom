//
//  MSThemeHelper.swift
//  MSCustomAi
//
//  Created by zz on 8.6.26.
//

import UIKit

import SwiftTheme

public typealias MSThemeColor = SwiftTheme.ThemeColorPicker
public typealias MSThemeCGColor = SwiftTheme.ThemeCGColorPicker

class MSThemeHelper: NSObject {
    // MARK: - CG Colors
    public static let mainCG: MSThemeCGColor = ["#1DCE9F", "#1DCE9F"]
    public static let clearCG: MSThemeCGColor = ["#00000000", "#00000000"]
    public static let whiteCG01: MSThemeCGColor = ["#FFFFFF", "#FFFFFFA6"]
    public static let black2CG : MSThemeCGColor = ["#00000033", "#00000000"]
    public static let black2CG_01 : MSThemeCGColor = ["#00000033", "#00000033"]
    public static let black8CG : MSThemeCGColor = ["#0000000F", "#FFFFFF"]
    public static let black8CG02 : MSThemeCGColor = ["#0000000F", "#00000000"]
    public static let black09CG : MSThemeCGColor = ["#00000017", "#FFFFFF26"]
    public static let black15CG : MSThemeCGColor = ["#00000026", "#FFFFFF26"]
    public static let black22CG : MSThemeCGColor = ["#00000038", "#FFFFFF38"]
    public static let black85CG : MSThemeCGColor = ["#000000D9", "#FFFFFFD9"]
    public static let redCG : MSThemeCGColor = ["#FF0000", "#FF0000"]
    public static let dc0c48 : MSThemeCGColor = ["#DC0C48", "#DC0C48"]
    public static let refreshCG : MSThemeCGColor = ["#316CA9", "#316CA9"]
    public static let pendBorderTheme : MSThemeCGColor = ["#FF9100FF", "#FF9100FF"]

    // MARK: - Brand / Main Color
    /* light  dark  */
    public static let clear: MSThemeColor = MSThemeColor.pickerWithUIColors([.clear, .clear])
    public static let mainColor : MSThemeColor = MSThemeColor("#1DCE9F", "#1DCE9F")
    public static let mainColor02 : MSThemeColor = MSThemeColor("#1DCE9F", "#FFFFFFA6")
    public static let mainColor03 : MSThemeColor = MSThemeColor("#1DCE9F", "#FFFFFF")
    public static let mainColor04 : MSThemeColor = MSThemeColor("#1DCE9F", "#1B1B1B")
    public static let mainColor05 : MSThemeColor = MSThemeColor("#1DCE9F1A", "#1DCE9F1A")
    public static let mainColor06 : MSThemeColor = MSThemeColor("#1DCE9F0F", "#1DCE9F0F")
    public static let mainEnableColor : MSThemeColor = MSThemeColor("#1DCE9F80", "#1DCE9F80")
    
    public static let color_mainColor20 : MSThemeColor = MSThemeColor("#1DCE9F33", "#1DCE9F33")
    public static let _44D7B6 : MSThemeColor = MSThemeColor("#44D7B6", "#44D7B6")
    public static let _22C187 : MSThemeColor = MSThemeColor("#22C18733", "#22C18733")

    // MARK: - Black / White Scale
    public static let blackTheme : MSThemeColor = MSThemeColor("#000000", "#FFFFFF")
    public static let blackTheme7 : MSThemeColor = MSThemeColor("#000000B3", "#FFFFFFB3")
    public static let blackTheme8 : MSThemeColor = MSThemeColor("#0000000F", "#FFFFFF0F")
    public static let blackTheme15 : MSThemeColor = MSThemeColor("#00000026", "#FFFFFF26")
    public static let blackTheme22 : MSThemeColor = MSThemeColor("#00000038", "#FFFFFF38")
    public static let blackTheme25 : MSThemeColor = MSThemeColor("#00000040", "#FFFFFF40")
    public static let blackTheme35 : MSThemeColor = MSThemeColor("#FFFFFF59", "#FFFFFF59")
    
    public static let blackTheme45 : MSThemeColor = MSThemeColor("#00000073", "#FFFFFF73")
    public static let blackTheme45_01 : MSThemeColor = MSThemeColor("#00000073", "#FFFFFF8C")
    public static let blackTheme45_02 : MSThemeColor = MSThemeColor("#00000073", "#FFFFFF8C")
    
    public static let blackTheme65 : MSThemeColor = MSThemeColor("#000000A6", "#FFFFFFA6")
    public static let blackTheme65_01 : MSThemeColor = MSThemeColor("#000000A6", "#000000D9")
    
    public static let blackTheme70 : MSThemeColor = MSThemeColor("#000000B3", "#00000000")
    
    public static let blackTheme85 : MSThemeColor = MSThemeColor("#000000D9", "#FFFFFFD9")
    public static let blackTheme85_01 : MSThemeColor = MSThemeColor("#000000D9", "#FFFFFF")
    public static let blackTheme85_02 : MSThemeColor = MSThemeColor("#000000D9", "#000000D9")
    public static let blackTheme85_03 : MSThemeColor = MSThemeColor("#000000D9", "#FFFFFF8C")
    public static let blackTheme85_04 : MSThemeColor = MSThemeColor("#000000D9", "#FFFFFFA6")
    
    public static let blackTheme95 : MSThemeColor = MSThemeColor("#000000F2", "#000000F2")
    public static let blackTheme95_01 : MSThemeColor = MSThemeColor("#000000F2", "#FFFFFFD9")

    // MARK: - White
    public static let mainWhite : MSThemeColor = MSThemeColor("#FFFFFF", "#FFFFFF")
    public static let mainWhite01 : MSThemeColor = MSThemeColor("#FFFFFF", "#000000D9")
    public static let mainWhiteTheme : MSThemeColor = MSThemeColor("#FFFFFF", "#262626")
    /// 白色背景对应暗黑
    public static let mainWhiteTheme2C : MSThemeColor = MSThemeColor("#FFFFFF", "#2C2C2C")
    public static let mainWhiteTheme1B : MSThemeColor = MSThemeColor("#FFFFFF", "#1B1B1B")

    // MARK: - Background
    public static let mainBackColor: MSThemeColor = MSThemeColor("#F8F8FB", "#1B1B1B")
    public static let mainBackColor26 : MSThemeColor = MSThemeColor("#F8F8FB", "#262626")
    public static let mainBack03 : MSThemeColor = MSThemeColor("#F8F8FB", "#2C2C2C")
    public static let mainBack04 : MSThemeColor = MSThemeColor("#F8F8FB", "#FFFFFF")
    public static let background1B: MSThemeColor = MSThemeColor("#F5F5F5", "#1B1B1B")
    public static let background: MSThemeColor = MSThemeColor("#F5F5F5", "#242424")
    public static let background02: MSThemeColor = MSThemeColor("#F5F5F5", "#2C2C2C")
}


public extension ThemeColorPicker {
    
    convenience init(_ colors: String...) {
        self.init(v: { ThemeManager.colorElement(for: colors) })
        
//        assert(themeConfigs?.count == 2, "theme color's count exception! check your init params ")
    }
}
