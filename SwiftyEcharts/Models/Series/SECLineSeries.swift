//
//  SECLineSeries.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

extension SECLineSeries {
    /// 坐标系枚举
    ///
    /// - cartesian2d: 二维的直角坐标系（也称笛卡尔坐标系），通过 xAxisIndex, yAxisIndex指定相应的坐标轴组件
    /// - polar: 极坐标系，通过 polarIndex 指定相应的极坐标组件
    public enum CoordinateSystem: String, SECJsonable{
        case cartesian2d = "cartesian2d"
        case polar = "polar"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
}

extension SECLineSeries {
    /// 折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，默认关闭，也就是全部绘制不过滤数据点。
    ///
    /// - average: 取过滤点的平均值
    /// - max: 取过滤点的最大值
    /// - min: 取过滤点的最小值
    /// - sum: 取过滤点的和
    public enum Sampling: String, SECJsonable {
        case average = "average"
        case max = "max"
        case min = "min"
        case sum = "sum"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
}

extension SECLineSeries {
    public struct LineStyle {
        public var normal: SECCommonLineStyleContent?
        
        public init() { }
    }
}

extension SECLineSeries.LineStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
    }
}

extension SECLineSeries {
    public struct  AreaStyle {
        public var normal: SECCommonAreaStyleContent?
        
        public init() { }
    }
}

extension SECLineSeries.AreaStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
    }
}

extension SECLineSeries {
    public struct Data: SECSymbolized {
        public struct Label {
            public var normal: SECCommonLabelStyle?
            
            public init() { }
        }

        public var name: String?
        public var value: Float?
        public var symbol: SECSymbol?
        public var symbolSize: Float?
        public var symbolRotate: Float?
        public var symbolOffset: [Float]?
        public var label: Label?
        public var itemStyle: SECItemStyle?
        
        public init() { }
    }
}

extension SECLineSeries.Data.Label : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
    }
}

/// 折线/面积图
/// 折线图是用折线将各个数据点标志连接起来的图表，用于展现数据的变化趋势。可用于直角坐标系和极坐标系上。
///
/// - Note: 设置 areaStyle 后可以绘制面积图。
/// - Note: 配合分段型 visualMap 组件可以将折线/面积图通过不同颜色分区间。如下示例
public struct SECLineSeries : SECSymbolized {
    
    public var name: String?
    public var coordinateSystem: CoordinateSystem?
    public var xAxisIndex: UInt?
    public var yAxisIndex: UInt?
    public var polarIndex: UInt?
    public var symbol: SECSymbol?
    public var symbolSize: Float?
    public var symbolRotate: Float?
    public var symbolOffset: [Float]?
    public var showSymbol: Bool?
    public var showAllSymbol: Bool?
    public var hoverAnimation: Bool?
    public var legendHoverLink: Bool?
    public var stack: String?
    public var connectNulls: Bool?
    public var clipOverflow: Bool?
    public var step: String? // FIXME: 类型？
    public var label: SECLabel?
    public var itemStyle: SECItemStyle?
    public var lineStyle: LineStyle?
    public var areaStyle: AreaStyle?
    public var smooth: Bool?
    public var smoothMonotone: String? // FIXME: 具体类型？
    public var sampling: Sampling?
    public var data: [Any]?
    
    public init() { }
    
}

extension SECLineSeries : SECSeries {
    public var type: String {
        return "line"
    }
}

extension SECLineSeries : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["name"] = name
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["polarIndex"] = polarIndex
        map["symbol"] = symbol
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["showSymbol"] = showSymbol
        map["showAllSymbol"] = showAllSymbol
        map["hoverAnimation"] = hoverAnimation
        map["legendHoverLink"] = legendHoverLink
        map["stack"] = stack
        map["connectNulls"] = connectNulls
        map["clipOverflow"] = clipOverflow
        map["step"] = step
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["lineStyle"] = lineStyle
        map["areaStyle"] = areaStyle
        map["smooth"] = smooth
        map["smoothMonotone"] = smoothMonotone
        map["sampling"] = sampling
        map["data"] = data
    }
}

