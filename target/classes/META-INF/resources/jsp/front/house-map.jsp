<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>地图</title>
    <script type="text/javascript"
            src="https://api.map.baidu.com/api?v=2.0&ak=hVcoW3dblL1f6u6lyYfWi5mdxjIuBIhu"></script>
</head>
<body>

<style type="text/css">
    #allmap {
        width: 100%;
        height: 100%;
        overflow: hidden;
        margin: 0;
        position: absolute;
        padding-bottom: 20px;
    }
</style>
<div id="allmap"></div>
<script type="text/javascript">
    function save_maps() {
        document.getElementById('maps').value
        api.close();
    }

    var is_bz = false;

    function set_cursor() {
        is_bz = true;
        map.setDefaultCursor("crosshair");
    }

    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(${longitude}, ${latitude}), 14);
    map.enableScrollWheelZoom();

    map.addEventListener("click", function (e) {
        if (!is_bz) {
            return;
        }
        map.clearOverlays()
        var point = new BMap.Point(e.point.lng, e.point.lat);
        document.getElementById('maps').value = e.point.lng + ',' + e.point.lat;
        var maker = new BMap.Marker(point);
        map.addOverlay(marker);
        marker.enableDragging();
        marker.addEventListener("dragend", function (e) {
            var p = marker.getPosition();
            document.getElementById('maps').value = p.lng + ',' + p.lat;
        });
    });

    var point = new BMap.Point(${longitude}, ${latitude});
    var marker = new BMap.Marker(point);
    map.addOverlay(marker);
    var sContent = "<div style='padding:10px;'><span style='font-size:12px;font-weight:bold;'>${address}</span></div>";
    var infoWindow = new BMap.InfoWindow(sContent);
    marker.addEventListener("click", function () {
        infoWindow.redraw();
    });
    marker.openInfoWindow(infoWindow);

    map.addControl(new BMap.MapTypeControl({
        mapTypes: [BMAP_NORMAL_MAP, BMAP_HYBRID_MAP]
    }));
    map.addControl(new BMap.MapTypeControl({
        anchor: BMAP_ANCHOR_TOP_RIGHT
    }));

    map.addControl(new BMap.NavigationControl());
    map.addControl(new BMap.MapTypeControl({
        anchor: BMAP_ANCHOR_BOTTOM_LEFT,
        type: BMAP_NAVIGATION_CONTROL_PAN

    }));


</script>


</body>
</html>
