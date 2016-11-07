<#assign ctx="${(rca.contextPath)!''}">

<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
    <title>大恩施</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${ctx}/static/libs/cloud/cloud.css">
    <script>
        var ctx = '${ctx}';
    </script>
</head>
<body>

<script type="text/javascript" src="${ctx}/static/libs/cloud/three.min.js"></script>
<script type="text/javascript" src="${ctx}/static/libs/cloud/Detector.js"></script>
<script id="vs" type="x-shader/x-vertex">
varying vec2 vUv;

void main() {

    vUv = uv;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );

}
</script>

<script id="fs" type="x-shader/x-fragment">
uniform sampler2D map;

uniform vec3 fogColor;
uniform float fogNear;
uniform float fogFar;

varying vec2 vUv;

void main() {

    float depth = gl_FragCoord.z / gl_FragCoord.w;
    float fogFactor = smoothstep( fogNear, fogFar, depth );

    gl_FragColor = texture2D( map, vUv );
    gl_FragColor.w *= pow( gl_FragCoord.z, 20.0 );
    gl_FragColor = mix( gl_FragColor, vec4( fogColor, gl_FragColor.w ), fogFactor );

}
</script>

<script src="${ctx}/static/libs/jquery/jquery.min.js"></script>
<script src="${ctx}/static/libs/cloud/init.js"></script>
</body>
</html>
