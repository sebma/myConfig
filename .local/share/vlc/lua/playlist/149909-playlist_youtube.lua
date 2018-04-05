<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"><script type="text/javascript">(window.NREUM||(NREUM={})).loader_config={xpid:"UAMCVFRbGwsGUlFTAgcB"};window.NREUM||(NREUM={}),__nr_require=function(t,n,e){function r(e){if(!n[e]){var o=n[e]={exports:{}};t[e][0].call(o.exports,function(n){var o=t[e][1][n];return r(o||n)},o,o.exports)}return n[e].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<e.length;o++)r(e[o]);return r}({1:[function(t,n,e){function r(t){try{s.console&&console.log(t)}catch(n){}}var o,i=t("ee"),a=t(15),s={};try{o=localStorage.getItem("__nr_flags").split(","),console&&"function"==typeof console.log&&(s.console=!0,o.indexOf("dev")!==-1&&(s.dev=!0),o.indexOf("nr_dev")!==-1&&(s.nrDev=!0))}catch(c){}s.nrDev&&i.on("internal-error",function(t){r(t.stack)}),s.dev&&i.on("fn-err",function(t,n,e){r(e.stack)}),s.dev&&(r("NR AGENT IN DEVELOPMENT MODE"),r("flags: "+a(s,function(t,n){return t}).join(", ")))},{}],2:[function(t,n,e){function r(t,n,e,r,s){try{p?p-=1:o(s||new UncaughtException(t,n,e),!0)}catch(f){try{i("ierr",[f,c.now(),!0])}catch(d){}}return"function"==typeof u&&u.apply(this,a(arguments))}function UncaughtException(t,n,e){this.message=t||"Uncaught error with no additional information",this.sourceURL=n,this.line=e}function o(t,n){var e=n?null:c.now();i("err",[t,e])}var i=t("handle"),a=t(16),s=t("ee"),c=t("loader"),f=t("gos"),u=window.onerror,d=!1,l="nr@seenError",p=0;c.features.err=!0,t(1),window.onerror=r;try{throw new Error}catch(h){"stack"in h&&(t(8),t(7),"addEventListener"in window&&t(5),c.xhrWrappable&&t(9),d=!0)}s.on("fn-start",function(t,n,e){d&&(p+=1)}),s.on("fn-err",function(t,n,e){d&&!e[l]&&(f(e,l,function(){return!0}),this.thrown=!0,o(e))}),s.on("fn-end",function(){d&&!this.thrown&&p>0&&(p-=1)}),s.on("internal-error",function(t){i("ierr",[t,c.now(),!0])})},{}],3:[function(t,n,e){t("loader").features.ins=!0},{}],4:[function(t,n,e){function r(t){}if(window.performance&&window.performance.timing&&window.performance.getEntriesByType){var o=t("ee"),i=t("handle"),a=t(8),s=t(7),c="learResourceTimings",f="addEventListener",u="resourcetimingbufferfull",d="bstResource",l="resource",p="-start",h="-end",m="fn"+p,w="fn"+h,v="bstTimer",y="pushState",g=t("loader");g.features.stn=!0,t(6);var b=NREUM.o.EV;o.on(m,function(t,n){var e=t[0];e instanceof b&&(this.bstStart=g.now())}),o.on(w,function(t,n){var e=t[0];e instanceof b&&i("bst",[e,n,this.bstStart,g.now()])}),a.on(m,function(t,n,e){this.bstStart=g.now(),this.bstType=e}),a.on(w,function(t,n){i(v,[n,this.bstStart,g.now(),this.bstType])}),s.on(m,function(){this.bstStart=g.now()}),s.on(w,function(t,n){i(v,[n,this.bstStart,g.now(),"requestAnimationFrame"])}),o.on(y+p,function(t){this.time=g.now(),this.startPath=location.pathname+location.hash}),o.on(y+h,function(t){i("bstHist",[location.pathname+location.hash,this.startPath,this.time])}),f in window.performance&&(window.performance["c"+c]?window.performance[f](u,function(t){i(d,[window.performance.getEntriesByType(l)]),window.performance["c"+c]()},!1):window.performance[f]("webkit"+u,function(t){i(d,[window.performance.getEntriesByType(l)]),window.performance["webkitC"+c]()},!1)),document[f]("scroll",r,{passive:!0}),document[f]("keypress",r,!1),document[f]("click",r,!1)}},{}],5:[function(t,n,e){function r(t){for(var n=t;n&&!n.hasOwnProperty(u);)n=Object.getPrototypeOf(n);n&&o(n)}function o(t){s.inPlace(t,[u,d],"-",i)}function i(t,n){return t[1]}var a=t("ee").get("events"),s=t(18)(a,!0),c=t("gos"),f=XMLHttpRequest,u="addEventListener",d="removeEventListener";n.exports=a,"getPrototypeOf"in Object?(r(document),r(window),r(f.prototype)):f.prototype.hasOwnProperty(u)&&(o(window),o(f.prototype)),a.on(u+"-start",function(t,n){var e=t[1],r=c(e,"nr@wrapped",function(){function t(){if("function"==typeof e.handleEvent)return e.handleEvent.apply(e,arguments)}var n={object:t,"function":e}[typeof e];return n?s(n,"fn-",null,n.name||"anonymous"):e});this.wrapped=t[1]=r}),a.on(d+"-start",function(t){t[1]=this.wrapped||t[1]})},{}],6:[function(t,n,e){var r=t("ee").get("history"),o=t(18)(r);n.exports=r,o.inPlace(window.history,["pushState","replaceState"],"-")},{}],7:[function(t,n,e){var r=t("ee").get("raf"),o=t(18)(r),i="equestAnimationFrame";n.exports=r,o.inPlace(window,["r"+i,"mozR"+i,"webkitR"+i,"msR"+i],"raf-"),r.on("raf-start",function(t){t[0]=o(t[0],"fn-")})},{}],8:[function(t,n,e){function r(t,n,e){t[0]=a(t[0],"fn-",null,e)}function o(t,n,e){this.method=e,this.timerDuration=isNaN(t[1])?0:+t[1],t[0]=a(t[0],"fn-",this,e)}var i=t("ee").get("timer"),a=t(18)(i),s="setTimeout",c="setInterval",f="clearTimeout",u="-start",d="-";n.exports=i,a.inPlace(window,[s,"setImmediate"],s+d),a.inPlace(window,[c],c+d),a.inPlace(window,[f,"clearImmediate"],f+d),i.on(c+u,r),i.on(s+u,o)},{}],9:[function(t,n,e){function r(t,n){d.inPlace(n,["onreadystatechange"],"fn-",s)}function o(){var t=this,n=u.context(t);t.readyState>3&&!n.resolved&&(n.resolved=!0,u.emit("xhr-resolved",[],t)),d.inPlace(t,y,"fn-",s)}function i(t){g.push(t),h&&(x?x.then(a):w?w(a):(E=-E,O.data=E))}function a(){for(var t=0;t<g.length;t++)r([],g[t]);g.length&&(g=[])}function s(t,n){return n}function c(t,n){for(var e in t)n[e]=t[e];return n}t(5);var f=t("ee"),u=f.get("xhr"),d=t(18)(u),l=NREUM.o,p=l.XHR,h=l.MO,m=l.PR,w=l.SI,v="readystatechange",y=["onload","onerror","onabort","onloadstart","onloadend","onprogress","ontimeout"],g=[];n.exports=u;var b=window.XMLHttpRequest=function(t){var n=new p(t);try{u.emit("new-xhr",[n],n),n.addEventListener(v,o,!1)}catch(e){try{u.emit("internal-error",[e])}catch(r){}}return n};if(c(p,b),b.prototype=p.prototype,d.inPlace(b.prototype,["open","send"],"-xhr-",s),u.on("send-xhr-start",function(t,n){r(t,n),i(n)}),u.on("open-xhr-start",r),h){var x=m&&m.resolve();if(!w&&!m){var E=1,O=document.createTextNode(E);new h(a).observe(O,{characterData:!0})}}else f.on("fn-end",function(t){t[0]&&t[0].type===v||a()})},{}],10:[function(t,n,e){function r(t){var n=this.params,e=this.metrics;if(!this.ended){this.ended=!0;for(var r=0;r<d;r++)t.removeEventListener(u[r],this.listener,!1);if(!n.aborted){if(e.duration=a.now()-this.startTime,4===t.readyState){n.status=t.status;var i=o(t,this.lastSize);if(i&&(e.rxSize=i),this.sameOrigin){var c=t.getResponseHeader("X-NewRelic-App-Data");c&&(n.cat=c.split(", ").pop())}}else n.status=0;e.cbTime=this.cbTime,f.emit("xhr-done",[t],t),s("xhr",[n,e,this.startTime])}}}function o(t,n){var e=t.responseType;if("json"===e&&null!==n)return n;var r="arraybuffer"===e||"blob"===e||"json"===e?t.response:t.responseText;return h(r)}function i(t,n){var e=c(n),r=t.params;r.host=e.hostname+":"+e.port,r.pathname=e.pathname,t.sameOrigin=e.sameOrigin}var a=t("loader");if(a.xhrWrappable){var s=t("handle"),c=t(11),f=t("ee"),u=["load","error","abort","timeout"],d=u.length,l=t("id"),p=t(14),h=t(13),m=window.XMLHttpRequest;a.features.xhr=!0,t(9),f.on("new-xhr",function(t){var n=this;n.totalCbs=0,n.called=0,n.cbTime=0,n.end=r,n.ended=!1,n.xhrGuids={},n.lastSize=null,p&&(p>34||p<10)||window.opera||t.addEventListener("progress",function(t){n.lastSize=t.loaded},!1)}),f.on("open-xhr-start",function(t){this.params={method:t[0]},i(this,t[1]),this.metrics={}}),f.on("open-xhr-end",function(t,n){"loader_config"in NREUM&&"xpid"in NREUM.loader_config&&this.sameOrigin&&n.setRequestHeader("X-NewRelic-ID",NREUM.loader_config.xpid)}),f.on("send-xhr-start",function(t,n){var e=this.metrics,r=t[0],o=this;if(e&&r){var i=h(r);i&&(e.txSize=i)}this.startTime=a.now(),this.listener=function(t){try{"abort"===t.type&&(o.params.aborted=!0),("load"!==t.type||o.called===o.totalCbs&&(o.onloadCalled||"function"!=typeof n.onload))&&o.end(n)}catch(e){try{f.emit("internal-error",[e])}catch(r){}}};for(var s=0;s<d;s++)n.addEventListener(u[s],this.listener,!1)}),f.on("xhr-cb-time",function(t,n,e){this.cbTime+=t,n?this.onloadCalled=!0:this.called+=1,this.called!==this.totalCbs||!this.onloadCalled&&"function"==typeof e.onload||this.end(e)}),f.on("xhr-load-added",function(t,n){var e=""+l(t)+!!n;this.xhrGuids&&!this.xhrGuids[e]&&(this.xhrGuids[e]=!0,this.totalCbs+=1)}),f.on("xhr-load-removed",function(t,n){var e=""+l(t)+!!n;this.xhrGuids&&this.xhrGuids[e]&&(delete this.xhrGuids[e],this.totalCbs-=1)}),f.on("addEventListener-end",function(t,n){n instanceof m&&"load"===t[0]&&f.emit("xhr-load-added",[t[1],t[2]],n)}),f.on("removeEventListener-end",function(t,n){n instanceof m&&"load"===t[0]&&f.emit("xhr-load-removed",[t[1],t[2]],n)}),f.on("fn-start",function(t,n,e){n instanceof m&&("onload"===e&&(this.onload=!0),("load"===(t[0]&&t[0].type)||this.onload)&&(this.xhrCbStart=a.now()))}),f.on("fn-end",function(t,n){this.xhrCbStart&&f.emit("xhr-cb-time",[a.now()-this.xhrCbStart,this.onload,n],n)})}},{}],11:[function(t,n,e){n.exports=function(t){var n=document.createElement("a"),e=window.location,r={};n.href=t,r.port=n.port;var o=n.href.split("://");!r.port&&o[1]&&(r.port=o[1].split("/")[0].split("@").pop().split(":")[1]),r.port&&"0"!==r.port||(r.port="https"===o[0]?"443":"80"),r.hostname=n.hostname||e.hostname,r.pathname=n.pathname,r.protocol=o[0],"/"!==r.pathname.charAt(0)&&(r.pathname="/"+r.pathname);var i=!n.protocol||":"===n.protocol||n.protocol===e.protocol,a=n.hostname===document.domain&&n.port===e.port;return r.sameOrigin=i&&(!n.hostname||a),r}},{}],12:[function(t,n,e){function r(){}function o(t,n,e){return function(){return i(t,[f.now()].concat(s(arguments)),n?null:this,e),n?void 0:this}}var i=t("handle"),a=t(15),s=t(16),c=t("ee").get("tracer"),f=t("loader"),u=NREUM;"undefined"==typeof window.newrelic&&(newrelic=u);var d=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],l="api-",p=l+"ixn-";a(d,function(t,n){u[n]=o(l+n,!0,"api")}),u.addPageAction=o(l+"addPageAction",!0),u.setCurrentRouteName=o(l+"routeName",!0),n.exports=newrelic,u.interaction=function(){return(new r).get()};var h=r.prototype={createTracer:function(t,n){var e={},r=this,o="function"==typeof n;return i(p+"tracer",[f.now(),t,e],r),function(){if(c.emit((o?"":"no-")+"fn-start",[f.now(),r,o],e),o)try{return n.apply(this,arguments)}catch(t){throw c.emit("fn-err",[arguments,this,t],e),t}finally{c.emit("fn-end",[f.now()],e)}}}};a("setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(t,n){h[n]=o(p+n)}),newrelic.noticeError=function(t){"string"==typeof t&&(t=new Error(t)),i("err",[t,f.now()])}},{}],13:[function(t,n,e){n.exports=function(t){if("string"==typeof t&&t.length)return t.length;if("object"==typeof t){if("undefined"!=typeof ArrayBuffer&&t instanceof ArrayBuffer&&t.byteLength)return t.byteLength;if("undefined"!=typeof Blob&&t instanceof Blob&&t.size)return t.size;if(!("undefined"!=typeof FormData&&t instanceof FormData))try{return JSON.stringify(t).length}catch(n){return}}}},{}],14:[function(t,n,e){var r=0,o=navigator.userAgent.match(/Firefox[\/\s](\d+\.\d+)/);o&&(r=+o[1]),n.exports=r},{}],15:[function(t,n,e){function r(t,n){var e=[],r="",i=0;for(r in t)o.call(t,r)&&(e[i]=n(r,t[r]),i+=1);return e}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],16:[function(t,n,e){function r(t,n,e){n||(n=0),"undefined"==typeof e&&(e=t?t.length:0);for(var r=-1,o=e-n||0,i=Array(o<0?0:o);++r<o;)i[r]=t[n+r];return i}n.exports=r},{}],17:[function(t,n,e){n.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],18:[function(t,n,e){function r(t){return!(t&&t instanceof Function&&t.apply&&!t[a])}var o=t("ee"),i=t(16),a="nr@original",s=Object.prototype.hasOwnProperty,c=!1;n.exports=function(t,n){function e(t,n,e,o){function nrWrapper(){var r,a,s,c;try{a=this,r=i(arguments),s="function"==typeof e?e(r,a):e||{}}catch(f){l([f,"",[r,a,o],s])}u(n+"start",[r,a,o],s);try{return c=t.apply(a,r)}catch(d){throw u(n+"err",[r,a,d],s),d}finally{u(n+"end",[r,a,c],s)}}return r(t)?t:(n||(n=""),nrWrapper[a]=t,d(t,nrWrapper),nrWrapper)}function f(t,n,o,i){o||(o="");var a,s,c,f="-"===o.charAt(0);for(c=0;c<n.length;c++)s=n[c],a=t[s],r(a)||(t[s]=e(a,f?s+o:o,i,s))}function u(e,r,o){if(!c||n){var i=c;c=!0;try{t.emit(e,r,o,n)}catch(a){l([a,e,r,o])}c=i}}function d(t,n){if(Object.defineProperty&&Object.keys)try{var e=Object.keys(t);return e.forEach(function(e){Object.defineProperty(n,e,{get:function(){return t[e]},set:function(n){return t[e]=n,n}})}),n}catch(r){l([r])}for(var o in t)s.call(t,o)&&(n[o]=t[o]);return n}function l(n){try{t.emit("internal-error",n)}catch(e){}}return t||(t=o),e.inPlace=f,e.flag=a,e}},{}],ee:[function(t,n,e){function r(){}function o(t){function n(t){return t&&t instanceof r?t:t?c(t,s,i):i()}function e(e,r,o,i){if(!l.aborted||i){t&&t(e,r,o);for(var a=n(o),s=h(e),c=s.length,f=0;f<c;f++)s[f].apply(a,r);var d=u[y[e]];return d&&d.push([g,e,r,a]),a}}function p(t,n){v[t]=h(t).concat(n)}function h(t){return v[t]||[]}function m(t){return d[t]=d[t]||o(e)}function w(t,n){f(t,function(t,e){n=n||"feature",y[e]=n,n in u||(u[n]=[])})}var v={},y={},g={on:p,emit:e,get:m,listeners:h,context:n,buffer:w,abort:a,aborted:!1};return g}function i(){return new r}function a(){(u.api||u.feature)&&(l.aborted=!0,u=l.backlog={})}var s="nr@context",c=t("gos"),f=t(15),u={},d={},l=n.exports=o();l.backlog=u},{}],gos:[function(t,n,e){function r(t,n,e){if(o.call(t,n))return t[n];var r=e();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(t,n,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return t[n]=r,r}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],handle:[function(t,n,e){function r(t,n,e,r){o.buffer([t],r),o.emit(t,n,e)}var o=t("ee").get("handle");n.exports=r,r.ee=o},{}],id:[function(t,n,e){function r(t){var n=typeof t;return!t||"object"!==n&&"function"!==n?-1:t===window?0:a(t,i,function(){return o++})}var o=1,i="nr@id",a=t("gos");n.exports=r},{}],loader:[function(t,n,e){function r(){if(!x++){var t=b.info=NREUM.info,n=l.getElementsByTagName("script")[0];if(setTimeout(u.abort,3e4),!(t&&t.licenseKey&&t.applicationID&&n))return u.abort();f(y,function(n,e){t[n]||(t[n]=e)}),c("mark",["onload",a()+b.offset],null,"api");var e=l.createElement("script");e.src="https://"+t.agent,n.parentNode.insertBefore(e,n)}}function o(){"complete"===l.readyState&&i()}function i(){c("mark",["domContent",a()+b.offset],null,"api")}function a(){return E.exists&&performance.now?Math.round(performance.now()):(s=Math.max((new Date).getTime(),s))-b.offset}var s=(new Date).getTime(),c=t("handle"),f=t(15),u=t("ee"),d=window,l=d.document,p="addEventListener",h="attachEvent",m=d.XMLHttpRequest,w=m&&m.prototype;NREUM.o={ST:setTimeout,SI:d.setImmediate,CT:clearTimeout,XHR:m,REQ:d.Request,EV:d.Event,PR:d.Promise,MO:d.MutationObserver};var v=""+location,y={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1071.min.js"},g=m&&w&&w[p]&&!/CriOS/.test(navigator.userAgent),b=n.exports={offset:s,now:a,origin:v,features:{},xhrWrappable:g};t(12),l[p]?(l[p]("DOMContentLoaded",i,!1),d[p]("load",r,!1)):(l[h]("onreadystatechange",o),d[h]("onload",r)),c("mark",["firstbyte",s],null,"api");var x=0,E=t(17)},{}]},{},["loader",2,10,4,3]);</script>
    <title> Youtube playlist - www.opendesktop.org</title><meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="author" content="Hive01 GmbH" />
<meta name="robots" content="all" />
<meta name="robots" content="index" />
<meta name="robots" content="follow" />
<meta name="revisit-after" content="3 days" />
<meta name="keywords" content="meta_keywords" lang="en-US" />
<meta name="description" content="Import a youtube video / playlist into VLC.&lt;br /&gt;
&lt;br /&gt;
&lt;br /&gt;
&lt;strong&gt;INSTALLATION:&lt;/strong&gt;&lt;br /&gt;
- click on the download button below&lt;br /&gt;
- when the file appears click on the menu file &amp;gt; save as... of your browser&lt;br /&gt;
- put the file in the...&lt;//&gt;&lt;/trong&gt;" />
<meta name="title" content=" Youtube playlist" />
<meta property="og:url" content="https://www.opendesktop.org/p/1154080/" />
<meta property="og:type" content="website" />
<meta property="og:title" content=" Youtube playlist" />
<meta property="og:description" content="Import a youtube video / playlist into VLC.&lt;br /&gt;
&lt;br /&gt;
&lt;br /&gt;
&lt;strong&gt;INSTALLATION:&lt;/strong&gt;&lt;br /&gt;
- click on the download button below&lt;br /&gt;
- when the file appears click on the menu file &amp;gt; save as... of your browser&lt;br /&gt;
- put the file in the...&lt;//&gt;&lt;/trong&gt;" />
<meta property="og:image" content="https://cn.pling.com/cache/400x400/img//hive/content-pre1/149909-1.jpeg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="alternate" type="application/rss+xml" title="Latest Products" href="/content.rdf"/>

    <link rel="stylesheet" type="text/css" href="/theme/flatui/js/lib/tooltipster/dist/css/tooltipster.bundle.min.css" />
    <link rel="stylesheet" type="text/css" href="/theme/flatui/js/lib/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-light.min.css" />
    <link rel="stylesheet" type="text/css" href="/theme/flatui/css/tooltipster-light-customized.css" />
    
    <!-- Loading Bootstrap -->
    <link rel="stylesheet" href="/theme/flatui/css/bootstrap/bootstrap.min.css" type="text/css"  crossorigin="anonymous">
    <link rel="stylesheet" href="/tools/fancybox2.1.4/jquery.fancybox.css?v=2.1.4" type="text/css" media="screen" />    
    <link rel="stylesheet" href="/theme/flatui/css/fontawsome/font-awesome.min.css"  crossorigin="anonymous">
    
    <!-- custom styles -->
    <link href="/theme/flatui/css/flex-layout.css" rel="stylesheet">
    <link href="/theme/flatui/css/style.css" rel="stylesheet">
    <link href="/theme/flatui/css/stylesheet.css?v1.4" rel="stylesheet">


    <link href="/theme/flatui/css/jquery.step.css" rel="stylesheet">
    

    <link rel="SHORTCUT ICON" href="/favicon.ico"/>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
    <script src="/theme/flatui/js/lib/html5shiv.js"></script>
    <![endif]-->

    <script src="/theme/flatui/js/lib/jquery-3.2.1.min.js" ></script>
    <script src="/theme/flatui/js/lib/bootstrap.min.js" ></script>    
    <script type="text/javascript" src="/theme/flatui/js/lib/tooltipster/dist/js/tooltipster.bundle.min.js"></script>
</head>
<body>

    <style>

        header a {
            color:  #ffffff;
        }

        header div.container.header {
            background-image: url('/images_sys/store_kde/kde-bg.png');
            background-color: #aaa;
            color: #0A0A0A;
            height: 90px;
        }

        header .logo-header {
            background-image: none;
            display: block;
            height: 90px;
            left: 0;
            position: absolute;
            top: 10px;
            width: 400px;
            z-index: 999;
            overflow: hidden;
        }

        header ul li:active {
            background: #60bcff none repeat scroll 0 0;
        }
        header ul li:hover {
            background: #FF8743 none repeat scroll 0 0;
        }

        header ul li ul li:active {
            background: #60bcff none repeat scroll 0 0;
        }

        header ul li ul li:hover {
            background: #FF8743 none repeat scroll 0 0;
        }
        header ul li:active > a {
            color: #1d1d1d;
        }
        header ul li:hover > a {
            color: #1d1d1d;
        }
        header ul li ul li:hover a {
            color: #1d1d1d;
        }

        ul.menu-nav-tabs li {
            background-color: #609dca;
            border-color: #a3acfd;
            border-image: none;
            border-radius: 5px 5px 0 0;
            border-style: solid solid none;
            border-width: 2px 2px 0;
            height: 24px;
            line-height: 24px;
            margin-right: 2px;
        }
    
        
        ul.menu-nav-tabs li.active {
            background: #60bcff none repeat scroll 0 0;
        }

        .absolute-left {
            left: 510px;
        }

        .absolute-right {
            right: 30px;
        }

        .header_cat_link {
              bottom: 0; position: absolute; color: blue; font-size: 18pt; left: 460px;
        } 
    
        .nav-divider-pling{
            color:#E2E2E2;
        }
        .nav-pills > li + li {
                margin-left: 10px;
            }
            .dropdown-menu > li > a{
                font-size: 12px;
            }
        .metamenu .dropdown:hover .dropdown-menu {
            margin-left: -16px;
        }
        .metamenu .dropdown-menu li{
            width: 100%;
        }

        .metamenu ul.dropdown-menu  li span{ color:#999; }
        .metamenu ul.dropdown-menu  li.active span{ color:#eee; }
    </style>

    <div class="small metamenu" >   
        <ul class="nav nav-pills meta-nav-top left"><li class="" style="background-color:#eee; -moz-border-radius: 5px; border-radius: 5px; "><a href="http://opendesktop.org"><img src="/images/system/ocs-logo-rounded-16x16.png" class="logo"/> openDesktop.org :</a> </li><li class="dropdown"><a href="#">Desktops</a><ul class="dropdown-menu"><li><a href="http://opendesktop.org/s/Cinnamon">Cinnamon</a> </li><li><a href="http://opendesktop.org/s/Enlightenment">Enlightenment</a> </li><li><a href="http://opendesktop.org/s/Gnome">Gnome</a> </li><li><a href="http://opendesktop.org/s/Mate">Mate</a> </li><li><a href="http://store.kde.org">KDE Store</a> </li><li><a href="http://opendesktop.org/s/Trinity">Trinity</a> </li><li><a href="http://opendesktop.org/s/XFCE">XFCE</a> </li><li><a href="http://opendesktop.org/s/Window-Managers">Window-Managers</a> </li></ul></li><li class="nav-divider-pling"> &#149; </li><li class="dropdown"><a href="#">Applications</a><ul class="dropdown-menu"><li><a href="http://opendesktop.org/s/Apps">Apps</a> </li><li><a href="http://opendesktop.org/s/Games">Games</a> </li><li><a href="http://opendesktop.org/s/AppImageHub.com">AppImageHub.com</a> </li><li><a href="http://opendesktop.org/s/Arch-Packages">Arch-Packages</a> </li><li><a href="http://opendesktop.org/s/Debian-Packages">Debian-Packages</a> </li><li><a href="http://opendesktop.org/s/OpenSuse-RPMs">OpenSuse-RPMs</a> </li><li><a href="http://opendesktop.org/s/Redhat-RPMs">Redhat-RPMs</a> </li><li><a href="http://opendesktop.org/s/Android-APKs">Android-APKs</a> </li><li><a href="http://opendesktop.org/s/OSX-Packages">OSX-Packages</a> </li><li><a href="http://opendesktop.org/s/Windows-Packages">Windows-Packages</a> </li></ul></li><li class="nav-divider-pling"> &#149; </li><li class="dropdown"><a href="#">Addons</a><ul class="dropdown-menu"><li><a href="http://opendesktop.org/s/App-Addons">App-Addons</a> </li><li><a href="http://addons.videolan.org">VLC-Addons</a> </li><li><a href="http://share.krita.org">Krita-Addons</a> </li><li><a href="http://opendesktop.org/s/subspace-continuum">subspace-continuum</a> </li><li><a href="http://opendesktop.org/s/Mycroft">Mycroft</a> </li></ul></li><li class="nav-divider-pling"> &#149; </li><li class="dropdown"><a href="#">Artwork</a><ul class="dropdown-menu"><li><a href="http://opendesktop.org/s/Cliparts">Cliparts</a> </li><li><a href="http://opendesktop.org/s/Images">Images</a> </li><li><a href="http://opendesktop.org/s/Wallpapers">Wallpapers</a> </li><li><a href="http://opendesktop.org/s/Historical-Look">Historical-Look</a> </li></ul></li><li class="nav-divider-pling"> &#149; </li><li class="dropdown"><a href="#">Other</a><ul class="dropdown-menu"><li><a href="http://opendesktop.org/s/Tutorials">Tutorials</a> </li><li><a href="http://opendesktop.org/s/Distros">Distros</a> </li><li><a href="http://opendesktop.org/s/Fonts">Fonts</a> </li></ul></li></ul>
            <ul class="nav nav-pills meta-nav-top right" style="margin-right: 30px;">             
               <li><a href="http://forum.opendesktop.org/" target="_blank"> Forum</a> </li>
               <li><a href="http://blog.opendesktop.org/" target="_blank"> Blog</a> </li>  
               <li><a  id="plingList" href="#plings" > What are Plings? </a> </li>             
               <li> <a id="aboutContent" href="#">About </a>   </li>              
            </ul>
        </div>

    <header id="page_header" xmlns="http://www.w3.org/1999/html">
        <div class="container header" style="position: relative;">

                            <ul class="menu-nav-tabs absolute-right" style="position: absolute;bottom: 0px;">
                    <li role="presentation"
                        class="">
                        <a href="https://www.opendesktop.org/register">Register</a></li>
                    <li role="presentation"
                        class="">
                        <a href="https://www.opendesktop.org/login/redirect/TFVIFZfgicowyCW5clpDz3sfM1rVUJsbjRWQM9hLKL5IhM3CvTGv5oxwgiT29kfJ">Login</a>
                    </li>
                </ul>
            
            <section class="container">
            <section class="wrapper">

                    <section>

                        <figure class="logo-header">                           
                           <a href="http://www.opendesktop.org">
                                <img width="400px" border="0"
                                     src="/images_sys/store_opendesktop/logo.png">
                            </a>
                        </figure>

                        <nav id="nav-top">
                            <div class="pull-left col-lg-5 col-md-5 col-sm-5 col-xs-5">
                            </div>

                            <div class="pull-right col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                                                                <form id="search" class="pull-right" action="/search">
                                    <input type="text" name="projectSearchText" class="content-search">

                                    <div class="icon-search-input absolute cursor-hand"
                                         onclick="$('#search').submit()"></div>
                                </form>
                            </div>
                        </nav>
                    </section>

                </section>
            </section>

            <section class="container">
                <section class="wrapper">
                    <span class="header_cat_link" id="header_cat_link">
                                               <a href="http://www.opendesktop.org">
                                                    </a>
                    </span>
                </section>
            </section>
        </div>
    </header>


    <!-- facebook -->
    <div id="fb-root"></div>

    <div id="report-product-1154080" class="modal report-product" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                </div>
                <form id="product-report" class="full-width partialjson" action="/report/product/"
                      data-target="#report-product-1154080-message">
                    <input type="hidden" name="p" value="1154080">
                    <div id="report-product-1154080-message">
                        <p>Do you really want to report this product?</p>
                        <div class="modal-footer">
                            <button type="submit" class="small">
                                <span class="glyphicon glyphicon-share-alt"></span> Yes
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
        
    <div id="like-product-modal" class="modal fade noid" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm" role="document">
           <div class="modal-content" style="min-height: 100px; ">
               <span style="text-align: center; display: block; padding-top: 30px">Please login.</span>
           </div>
         </div>          
    </div>
    
        
            <div id="review-product-modal" class="modal fade noid" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-sm" role="document">
               <div class="modal-content" style="min-height: 150px; ">
                   <span style="text-align: center; display: block; padding-top: 30px">Only registered members with an active supporting can vote<br/>to limit spam and fraud voting.<br/> <a href="/support">Become a supporter</a> <br/><br/>You can still 'Like' a product, but that doesn't affect its score. </span>
               </div>
             </div>          
        </div>
        
        
    

    <main id="product-page-content">
        <div class="flex-column">
            <div class="flex-item-4 sidebar-left" style="">
                <style type="text/css">
   
    .naviblock {
        list-style-type: none;
        margin: 0;
        padding: 0;
        width: 100%;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        font-size: 12px;
        border: none;
        width: 100%;
        color: #2673b0;        
    }
    .navilink {
        color: #2673b0;
        margin: 0;
        padding: 3px 0 0 10px;
    }
    .navilink span.title:hover {
        font-weight: bold;
        cursor: pointer;
    }
    ul.naviblock a:hover
    {
        background-color:  #60bcff !important;
        color:  #ffffff !important;
    }
    ul.naviblock a
    {
          display: block;
            width:100%;
    }
    li.navilink.parentactive.parent a
    {
        color:  #60bcff;
    }
    ul.naviblock a.active.child
    {
        background-color:  #60bcff;
        color:  #ffffff;
    }
    li.navilink.active.parent a.active.parent{

        background-color:  #60bcff;
        color:  #ffffff;
    }
    li.navilink span.cat-title {
        display: inline-block;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        width: 75%;
        vertical-align: middle;
        padding-left: 3px;
    }
    li.navilink span.product-counter {
        display: inline-block;
        vertical-align: middle;
        text-align: end;
        width: 20%;
    }

    /*
    li.navilink.active.parent a.child{       
        color:  #60bcff;
    }
   */
</style> 
<div class="panel-group" id="accordion">
    <div class="panel panel-default accordion-group">
            <div style="margin-left: -10px">
            <ul id='cat-tree' class='naviblock parent'><li class='navilink parent'><span class='title'><a class='parent' href='/browse/' data-id='0'><span class='cat-title'>All</span></a></span></li><li class='navilink parent'><span class='title'><a class='parent' href='/browse/cat/152/' data-id='152' title='App Addons'><span class='cat-title'>App Addons</span> <span class='product-counter'>3632</span> </a></span><span id='152' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/473/' data-id='473' title='aMSN'><span class='cat-title'>aMSN</span> <span class='product-counter'>52</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/282/' data-id='282' title='Chrome/Chromium'><span class='cat-title'>Chrome/Chromium</span> <span class='product-counter'>5</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/479/' data-id='479' title='Covergloobus'><span class='cat-title'>Covergloobus</span> <span class='product-counter'>19</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/190/' data-id='190' title='Gimp'><span class='cat-title'>Gimp</span> <span class='product-counter'>247</span> </a></span><span id='190' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/191/' data-id='191' title='Gimp Brushes'><span class='cat-title'>Gimp Brushes</span> <span class='product-counter'>39</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/193/' data-id='193' title='Gimp Palettes'><span class='cat-title'>Gimp Palettes</span> <span class='product-counter'>6</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/192/' data-id='192' title='Gimp Patterns'><span class='cat-title'>Gimp Patterns</span> <span class='product-counter'>8</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/194/' data-id='194' title='Gimp Splashes'><span class='cat-title'>Gimp Splashes</span> <span class='product-counter'>185</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/268/' data-id='268' title='Gimp Themes'><span class='cat-title'>Gimp Themes</span> <span class='product-counter'>9</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/448/' data-id='448' title='GMusicbrowser Layouts'><span class='cat-title'>GMusicbrowser Layouts</span> <span class='product-counter'>5</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/382/' data-id='382' title='Gnome App-Addons'><span class='cat-title'>Gnome App-Addons</span> <span class='product-counter'>356</span> </a></span><span id='382' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/279/' data-id='279' title='Gedit Color Schemes'><span class='cat-title'>Gedit Color Schemes</span> <span class='product-counter'>13</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/126/' data-id='126' title='Nautilus Scripts'><span class='cat-title'>Nautilus Scripts</span> <span class='product-counter'>343</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/195/' data-id='195' title='Inkscape'><span class='cat-title'>Inkscape</span> <span class='product-counter'>36</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/380/' data-id='380' title='KDE App-Addons'><span class='cat-title'>KDE App-Addons</span> <span class='product-counter'>1990</span> </a></span><span id='380' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/340/' data-id='340' title='Amarok'><span class='cat-title'>Amarok</span> <span class='product-counter'>622</span> </a></span><span id='340' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/259/' data-id='259' title='Amarok 1.x Scripts'><span class='cat-title'>Amarok 1.x Scripts</span> <span class='product-counter'>291</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/260/' data-id='260' title='Amarok 2.x Scripts'><span class='cat-title'>Amarok 2.x Scripts</span> <span class='product-counter'>227</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/179/' data-id='179' title='Amarok Themes'><span class='cat-title'>Amarok Themes</span> <span class='product-counter'>104</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/477/' data-id='477' title='Digikam'><span class='cat-title'>Digikam</span> <span class='product-counter'>4</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/102/' data-id='102' title='Dolphin Service Menus'><span class='cat-title'>Dolphin Service Menus</span> <span class='product-counter'>478</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/180/' data-id='180' title='K3b Themes'><span class='cat-title'>K3b Themes</span> <span class='product-counter'>25</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/472/' data-id='472' title='Kate'><span class='cat-title'>Kate</span> <span class='product-counter'>64</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/333/' data-id='333' title='Kdenlive'><span class='cat-title'>Kdenlive</span> <span class='product-counter'>69</span> </a></span><span id='333' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/334/' data-id='334' title='Kdenlive Export Profiles'><span class='cat-title'>Kdenlive Export Profiles</span> <span class='product-counter'>1</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/185/' data-id='185' title='Kdenlive FX'><span class='cat-title'>Kdenlive FX</span> <span class='product-counter'>63</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/426/' data-id='426' title='Kdenlive Keyboard Schemes'><span class='cat-title'>Kdenlive Keyboard Schemes</span> <span class='product-counter'>1</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/335/' data-id='335' title='Kdenlive Title Templates'><span class='cat-title'>Kdenlive Title Templates</span> <span class='product-counter'>4</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/342/' data-id='342' title='KDevelop'><span class='cat-title'>KDevelop</span> <span class='product-counter'>30</span> </a></span><span id='342' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/328/' data-id='328' title='KDevelop App Templates'><span class='cat-title'>KDevelop App Templates</span> <span class='product-counter'>21</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/327/' data-id='327' title='KDevelop File Templates'><span class='cat-title'>KDevelop File Templates</span> <span class='product-counter'>9</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/462/' data-id='462' title='Konsole Color Schemes'><span class='cat-title'>Konsole Color Schemes</span> <span class='product-counter'>7</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/343/' data-id='343' title='Kontact/PIM'><span class='cat-title'>Kontact/PIM</span> <span class='product-counter'>36</span> </a></span><span id='343' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/354/' data-id='354' title='Akonadi Email Providers'><span class='cat-title'>Akonadi Email Providers</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/347/' data-id='347' title='KAdressbook Themes'><span class='cat-title'>KAdressbook Themes</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/346/' data-id='346' title='KMail Header Themes'><span class='cat-title'>KMail Header Themes</span> <span class='product-counter'>6</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/345/' data-id='345' title='KNotes Printing Themes'><span class='cat-title'>KNotes Printing Themes</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/344/' data-id='344' title='KOrganizer Calendars'><span class='cat-title'>KOrganizer Calendars</span> <span class='product-counter'>30</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/348/' data-id='348' title='Script Sieve'><span class='cat-title'>Script Sieve</span> <span class='product-counter'></span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/405/' data-id='405' title='Konversation Nicklist Themes'><span class='cat-title'>Konversation Nicklist Themes</span> <span class='product-counter'>14</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/229/' data-id='229' title='Kopete Styles'><span class='cat-title'>Kopete Styles</span> <span class='product-counter'>97</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/375/' data-id='375' title='Krunner Plugins'><span class='cat-title'>Krunner Plugins</span> <span class='product-counter'>27</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/370/' data-id='370' title='Krusader'><span class='cat-title'>Krusader</span> <span class='product-counter'>57</span> </a></span><span id='370' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/371/' data-id='371' title='Krusader Colormaps'><span class='cat-title'>Krusader Colormaps</span> <span class='product-counter'>10</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/373/' data-id='373' title='Krusader JS Extensions'><span class='cat-title'>Krusader JS Extensions</span> <span class='product-counter'>3</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/372/' data-id='372' title='Krusader User Actions'><span class='cat-title'>Krusader User Actions</span> <span class='product-counter'>44</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/220/' data-id='220' title='KStars Data'><span class='cat-title'>KStars Data</span> <span class='product-counter'>9</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/213/' data-id='213' title='KTextEditor Snippets'><span class='cat-title'>KTextEditor Snippets</span> <span class='product-counter'>58</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/219/' data-id='219' title='KTurtle Scripts'><span class='cat-title'>KTurtle Scripts</span> <span class='product-counter'>24</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/217/' data-id='217' title='Marble Maps'><span class='cat-title'>Marble Maps</span> <span class='product-counter'>3</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/214/' data-id='214' title='Okteta Structure Definitions'><span class='cat-title'>Okteta Structure Definitions</span> <span class='product-counter'>21</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/356/' data-id='356' title='Parley'><span class='cat-title'>Parley</span> <span class='product-counter'>156</span> </a></span><span id='356' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/357/' data-id='357' title='Parley Themes'><span class='cat-title'>Parley Themes</span> <span class='product-counter'>6</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/216/' data-id='216' title='Parley Vocabulary Files'><span class='cat-title'>Parley Vocabulary Files</span> <span class='product-counter'>150</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/212/' data-id='212' title='Plasma Public Transport Timetables'><span class='cat-title'>Plasma Public Transport Timetables</span> <span class='product-counter'>49</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/317/' data-id='317' title='Simon Speech'><span class='cat-title'>Simon Speech</span> <span class='product-counter'>61</span> </a></span><span id='317' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/318/' data-id='318' title='Simon Base Models'><span class='cat-title'>Simon Base Models</span> <span class='product-counter'>5</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/320/' data-id='320' title='Simon Dictionaries'><span class='cat-title'>Simon Dictionaries</span> <span class='product-counter'>2</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/319/' data-id='319' title='Simon Scenarios'><span class='cat-title'>Simon Scenarios</span> <span class='product-counter'>54</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/341/' data-id='341' title='Skrooge'><span class='cat-title'>Skrooge</span> <span class='product-counter'>10</span> </a></span><span id='341' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/339/' data-id='339' title='Skrooge Quote Sources'><span class='cat-title'>Skrooge Quote Sources</span> <span class='product-counter'>5</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/338/' data-id='338' title='Skrooge Report Templates'><span class='cat-title'>Skrooge Report Templates</span> <span class='product-counter'>5</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/416/' data-id='416' title='System Monitor Tabs'><span class='cat-title'>System Monitor Tabs</span> <span class='product-counter'>3</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/184/' data-id='184' title='Yakuake Skins'><span class='cat-title'>Yakuake Skins</span> <span class='product-counter'>66</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/355/' data-id='355' title='KDE Game-Addons'><span class='cat-title'>KDE Game-Addons</span> <span class='product-counter'>87</span> </a></span><span id='355' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/336/' data-id='336' title='Kanagram'><span class='cat-title'>Kanagram</span> <span class='product-counter'>5</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/351/' data-id='351' title='KAtomic Levels'><span class='cat-title'>KAtomic Levels</span> <span class='product-counter'>2</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/406/' data-id='406' title='KBlocks Themes'><span class='cat-title'>KBlocks Themes</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/407/' data-id='407' title='KDiamonds Themes'><span class='cat-title'>KDiamonds Themes</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/408/' data-id='408' title='KGoldrunner Themes'><span class='cat-title'>KGoldrunner Themes</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/337/' data-id='337' title='Khangman'><span class='cat-title'>Khangman</span> <span class='product-counter'>17</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/409/' data-id='409' title='Kigo Games'><span class='cat-title'>Kigo Games</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/410/' data-id='410' title='Kigo Themes'><span class='cat-title'>Kigo Themes</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/183/' data-id='183' title='Knights Themes'><span class='cat-title'>Knights Themes</span> <span class='product-counter'>8</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/471/' data-id='471' title='KPatience'><span class='cat-title'>KPatience</span> <span class='product-counter'>13</span> </a></span><span id='471' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/215/' data-id='215' title='KPat Decks'><span class='cat-title'>KPat Decks</span> <span class='product-counter'>10</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/353/' data-id='353' title='KPat Themes'><span class='cat-title'>KPat Themes</span> <span class='product-counter'>3</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/411/' data-id='411' title='KSirk Themes'><span class='cat-title'>KSirk Themes</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/412/' data-id='412' title='KSnakeDuel Themes'><span class='cat-title'>KSnakeDuel Themes</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/413/' data-id='413' title='KSudoku Games'><span class='cat-title'>KSudoku Games</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/218/' data-id='218' title='KWordQuiz'><span class='cat-title'>KWordQuiz</span> <span class='product-counter'>42</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/467/' data-id='467' title='Kirocker'><span class='cat-title'>Kirocker</span> <span class='product-counter'>10</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/176/' data-id='176' title='Krita'><span class='cat-title'>Krita</span> <span class='product-counter'>9</span> </a></span><span id='176' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/163/' data-id='163' title='Krita Color Profiles'><span class='cat-title'>Krita Color Profiles</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/165/' data-id='165' title='Krita Resource Bundles'><span class='cat-title'>Krita Resource Bundles</span> <span class='product-counter'>8</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/164/' data-id='164' title='Krita Templates'><span class='cat-title'>Krita Templates</span> <span class='product-counter'>1</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/186/' data-id='186' title='LibreOffice/OpenOffice'><span class='cat-title'>LibreOffice/OpenOffice</span> <span class='product-counter'>233</span> </a></span><span id='186' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/271/' data-id='271' title='LibreOffice Splash Screens'><span class='cat-title'>LibreOffice Splash Screens</span> <span class='product-counter'>35</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/189/' data-id='189' title='ODF Presentation'><span class='cat-title'>ODF Presentation</span> <span class='product-counter'>48</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/188/' data-id='188' title='ODF Spreadsheet'><span class='cat-title'>ODF Spreadsheet</span> <span class='product-counter'>32</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/187/' data-id='187' title='ODF Text'><span class='cat-title'>ODF Text</span> <span class='product-counter'>50</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/476/' data-id='476' title='OpenOffice Splash Screens'><span class='cat-title'>OpenOffice Splash Screens</span> <span class='product-counter'>68</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/469/' data-id='469' title='Mixxx Skins'><span class='cat-title'>Mixxx Skins</span> <span class='product-counter'>2</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/415/' data-id='415' title='Mycroft Skills'><span class='cat-title'>Mycroft Skills</span> <span class='product-counter'>1</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/232/' data-id='232' title='Noatun Skins'><span class='cat-title'>Noatun Skins</span> <span class='product-counter'>40</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/474/' data-id='474' title='Opera'><span class='cat-title'>Opera</span> <span class='product-counter'>6</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/449/' data-id='449' title='Pidgin'><span class='cat-title'>Pidgin</span> <span class='product-counter'>26</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/196/' data-id='196' title='Scribus'><span class='cat-title'>Scribus</span> <span class='product-counter'>75</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/198/' data-id='198' title='SMPlayer/MPlayer'><span class='cat-title'>SMPlayer/MPlayer</span> <span class='product-counter'>30</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/427/' data-id='427' title='SubSpace Continuum'><span class='cat-title'>SubSpace Continuum</span> <span class='product-counter'></span> </a></span><span id='427' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/428/' data-id='428' title='Audio/Visuals'><span class='cat-title'>Audio/Visuals</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/429/' data-id='429' title='Banners'><span class='cat-title'>Banners</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/430/' data-id='430' title='Bots'><span class='cat-title'>Bots</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/431/' data-id='431' title='Catids'><span class='cat-title'>Catids</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/432/' data-id='432' title='Clients'><span class='cat-title'>Clients</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/433/' data-id='433' title='Editors'><span class='cat-title'>Editors</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/434/' data-id='434' title='Fonts'><span class='cat-title'>Fonts</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/435/' data-id='435' title='Graphics'><span class='cat-title'>Graphics</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/436/' data-id='436' title='Images'><span class='cat-title'>Images</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/437/' data-id='437' title='Misc'><span class='cat-title'>Misc</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/438/' data-id='438' title='Mods'><span class='cat-title'>Mods</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/439/' data-id='439' title='Server'><span class='cat-title'>Server</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/440/' data-id='440' title='Skins'><span class='cat-title'>Skins</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/441/' data-id='441' title='Sounds'><span class='cat-title'>Sounds</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/442/' data-id='442' title='SubspaceISO'><span class='cat-title'>SubspaceISO</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/443/' data-id='443' title='Zones'><span class='cat-title'>Zones</span> <span class='product-counter'></span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/368/' data-id='368' title='Telegram Themes'><span class='cat-title'>Telegram Themes</span> <span class='product-counter'>10</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/281/' data-id='281' title='Thunderbird Themes'><span class='cat-title'>Thunderbird Themes</span> <span class='product-counter'>1</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/402/' data-id='402' title='Various Scripts and Stuff'><span class='cat-title'>Various Scripts and Stuff</span> <span class='product-counter'>3</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/478/' data-id='478' title='VIM'><span class='cat-title'>VIM</span> <span class='product-counter'>4</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/321/' data-id='321' title='VLC'><span class='cat-title'>VLC</span> <span class='product-counter'>165</span> </a></span><span id='321' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/323/' data-id='323' title='VLC Extensions'><span class='cat-title'>VLC Extensions</span> <span class='product-counter'>69</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/322/' data-id='322' title='VLC Internet Channels'><span class='cat-title'>VLC Internet Channels</span> <span class='product-counter'>12</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/326/' data-id='326' title='VLC Other'><span class='cat-title'>VLC Other</span> <span class='product-counter'>6</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/324/' data-id='324' title='VLC Playlist Parsers'><span class='cat-title'>VLC Playlist Parsers</span> <span class='product-counter'>39</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/325/' data-id='325' title='VLC Plugins'><span class='cat-title'>VLC Plugins</span> <span class='product-counter'>2</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/128/' data-id='128' title='VLC Skins'><span class='cat-title'>VLC Skins</span> <span class='product-counter'>37</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/129/' data-id='129' title='XMMS Skins'><span class='cat-title'>XMMS Skins</span> <span class='product-counter'>220</span> </a></span></li></ul></span></li><li class='navilink parent'><span class='title'><a class='parent' href='/browse/cat/233/' data-id='233' title='Apps'><span class='cat-title'>Apps</span> <span class='product-counter'>6326</span> </a></span><span id='233' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/392/' data-id='392' title='Audio'><span class='cat-title'>Audio</span> <span class='product-counter'>536</span> </a></span><span id='392' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/237/' data-id='237' title='Audio'><span class='cat-title'>Audio</span> <span class='product-counter'>442</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/397/' data-id='397' title='Audio Extractors/Converters'><span class='cat-title'>Audio Extractors/Converters</span> <span class='product-counter'>16</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/393/' data-id='393' title='Audioplayers'><span class='cat-title'>Audioplayers</span> <span class='product-counter'>42</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/396/' data-id='396' title='MP3 Taggers'><span class='cat-title'>MP3 Taggers</span> <span class='product-counter'>7</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/394/' data-id='394' title='Music Production'><span class='cat-title'>Music Production</span> <span class='product-counter'>23</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/395/' data-id='395' title='Radio'><span class='cat-title'>Radio</span> <span class='product-counter'>6</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/387/' data-id='387' title='Communication'><span class='cat-title'>Communication</span> <span class='product-counter'>194</span> </a></span><span id='387' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/250/' data-id='250' title='Chat'><span class='cat-title'>Chat</span> <span class='product-counter'>156</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/242/' data-id='242' title='Telephony'><span class='cat-title'>Telephony</span> <span class='product-counter'>38</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/234/' data-id='234' title='Database'><span class='cat-title'>Database</span> <span class='product-counter'>73</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/243/' data-id='243' title='Development'><span class='cat-title'>Development</span> <span class='product-counter'>531</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/6/' data-id='6' title='Games'><span class='cat-title'>Games</span> <span class='product-counter'>421</span> </a></span><span id='6' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/202/' data-id='202' title='Arcade'><span class='cat-title'>Arcade</span> <span class='product-counter'>167</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/203/' data-id='203' title='Board'><span class='cat-title'>Board</span> <span class='product-counter'>91</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/204/' data-id='204' title='Card'><span class='cat-title'>Card</span> <span class='product-counter'>32</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/206/' data-id='206' title='Games Other'><span class='cat-title'>Games Other</span> <span class='product-counter'>101</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/205/' data-id='205' title='Tactics & Strategy'><span class='cat-title'>Tactics & Strategy</span> <span class='product-counter'>30</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/239/' data-id='239' title='Graphics'><span class='cat-title'>Graphics</span> <span class='product-counter'>553</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/391/' data-id='391' title='Network & Security'><span class='cat-title'>Network & Security</span> <span class='product-counter'>469</span> </a></span><span id='391' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/251/' data-id='251' title='Network'><span class='cat-title'>Network</span> <span class='product-counter'>381</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/246/' data-id='246' title='Security'><span class='cat-title'>Security</span> <span class='product-counter'>88</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/450/' data-id='450' title='Productivity'><span class='cat-title'>Productivity</span> <span class='product-counter'>452</span> </a></span><span id='450' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/235/' data-id='235' title='Financial'><span class='cat-title'>Financial</span> <span class='product-counter'>54</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/236/' data-id='236' title='Groupware'><span class='cat-title'>Groupware</span> <span class='product-counter'>198</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/222/' data-id='222' title='Office'><span class='cat-title'>Office</span> <span class='product-counter'>98</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/240/' data-id='240' title='Text Editors'><span class='cat-title'>Text Editors</span> <span class='product-counter'>102</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/280/' data-id='280' title='Qt Other'><span class='cat-title'>Qt Other</span> <span class='product-counter'>364</span> </a></span><span id='280' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/253/' data-id='253' title='Qt Components'><span class='cat-title'>Qt Components</span> <span class='product-counter'>58</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/255/' data-id='255' title='Qt Mobile'><span class='cat-title'>Qt Mobile</span> <span class='product-counter'>69</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/254/' data-id='254' title='Qt Stuff'><span class='cat-title'>Qt Stuff</span> <span class='product-counter'>95</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/252/' data-id='252' title='Qt Widgets'><span class='cat-title'>Qt Widgets</span> <span class='product-counter'>142</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/388/' data-id='388' title='Science & Education'><span class='cat-title'>Science & Education</span> <span class='product-counter'>506</span> </a></span><span id='388' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/241/' data-id='241' title='Education'><span class='cat-title'>Education</span> <span class='product-counter'>200</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/247/' data-id='247' title='Science'><span class='cat-title'>Science</span> <span class='product-counter'>306</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/376/' data-id='376' title='Social'><span class='cat-title'>Social</span> <span class='product-counter'>5</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/245/' data-id='245' title='System Software'><span class='cat-title'>System Software</span> <span class='product-counter'>610</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/244/' data-id='244' title='Utilities'><span class='cat-title'>Utilities</span> <span class='product-counter'>1089</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/481/' data-id='481' title='Video'><span class='cat-title'>Video</span> <span class='product-counter'>316</span> </a></span><span id='481' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/485/' data-id='485' title='TV & Streaming'><span class='cat-title'>TV & Streaming</span> <span class='product-counter'>8</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/238/' data-id='238' title='Video'><span class='cat-title'>Video</span> <span class='product-counter'>270</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/484/' data-id='484' title='Video Converter'><span class='cat-title'>Video Converter</span> <span class='product-counter'>13</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/482/' data-id='482' title='Video Players'><span class='cat-title'>Video Players</span> <span class='product-counter'>18</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/483/' data-id='483' title='Video Production'><span class='cat-title'>Video Production</span> <span class='product-counter'>7</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/389/' data-id='389' title='Web & Email'><span class='cat-title'>Web & Email</span> <span class='product-counter'>207</span> </a></span><span id='389' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/249/' data-id='249' title='Email'><span class='cat-title'>Email</span> <span class='product-counter'>55</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/248/' data-id='248' title='Web'><span class='cat-title'>Web</span> <span class='product-counter'>152</span> </a></span></li></ul></span></li></ul></span></li><li class='navilink parent'><span class='title'><a class='parent' href='/browse/cat/404/' data-id='404' title='Distros'><span class='cat-title'>Distros</span> <span class='product-counter'>5</span> </a></span></li><li class='navilink parent'><span class='title'><a class='parent' href='/browse/cat/148/' data-id='148' title='Linux/Unix Desktops'><span class='cat-title'>Linux/Unix Desktops</span> <span class='product-counter'>45116</span> </a></span><span id='148' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/151/' data-id='151' title='Boot and Splashscreens'><span class='cat-title'>Boot and Splashscreens</span> <span class='product-counter'>1258</span> </a></span><span id='151' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/486/' data-id='486' title='Bootsplash Various'><span class='cat-title'>Bootsplash Various</span> <span class='product-counter'>364</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/480/' data-id='480' title='GFXBoot'><span class='cat-title'>GFXBoot</span> <span class='product-counter'>34</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/109/' data-id='109' title='GRUB Themes'><span class='cat-title'>GRUB Themes</span> <span class='product-counter'>357</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/108/' data-id='108' title='Plymouth Themes'><span class='cat-title'>Plymouth Themes</span> <span class='product-counter'>266</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/278/' data-id='278' title='Splashy Themes'><span class='cat-title'>Splashy Themes</span> <span class='product-counter'>32</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/269/' data-id='269' title='Usplash Themes'><span class='cat-title'>Usplash Themes</span> <span class='product-counter'>168</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/270/' data-id='270' title='XSplash Themes'><span class='cat-title'>XSplash Themes</span> <span class='product-counter'>37</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/107/' data-id='107' title='Cursors'><span class='cat-title'>Cursors</span> <span class='product-counter'>873</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/384/' data-id='384' title='Desktop Extensions'><span class='cat-title'>Desktop Extensions</span> <span class='product-counter'>7196</span> </a></span><span id='384' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/465/' data-id='465' title='Amor Themes'><span class='cat-title'>Amor Themes</span> <span class='product-counter'>23</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/208/' data-id='208' title='Cairo Clock'><span class='cat-title'>Cairo Clock</span> <span class='product-counter'>275</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/414/' data-id='414' title='Cinnamon Extensions'><span class='cat-title'>Cinnamon Extensions</span> <span class='product-counter'>3</span> </a></span><span id='414' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/264/' data-id='264' title='Cinnamon Applets'><span class='cat-title'>Cinnamon Applets</span> <span class='product-counter'>1</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/57/' data-id='57' title='Cinnamon Desklets'><span class='cat-title'>Cinnamon Desklets</span> <span class='product-counter'>1</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/265/' data-id='265' title='Cinnamon Extensions'><span class='cat-title'>Cinnamon Extensions</span> <span class='product-counter'>1</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/124/' data-id='124' title='Conky'><span class='cat-title'>Conky</span> <span class='product-counter'>1129</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/377/' data-id='377' title='GKrellM'><span class='cat-title'>GKrellM</span> <span class='product-counter'>15</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/460/' data-id='460' title='Gnome'><span class='cat-title'>Gnome</span> <span class='product-counter'>1415</span> </a></span><span id='460' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/156/' data-id='156' title='Gnome Extensions'><span class='cat-title'>Gnome Extensions</span> <span class='product-counter'>7</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/207/' data-id='207' title='Various Gnome Stuff'><span class='cat-title'>Various Gnome Stuff</span> <span class='product-counter'>1408</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/178/' data-id='178' title='Karamba & Superkaramba'><span class='cat-title'>Karamba & Superkaramba</span> <span class='product-counter'>1832</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/423/' data-id='423' title='KDE Plasma Extensions'><span class='cat-title'>KDE Plasma Extensions</span> <span class='product-counter'>1760</span> </a></span><span id='423' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/106/' data-id='106' title='Plasma 4 Widgets'><span class='cat-title'>Plasma 4 Widgets</span> <span class='product-counter'>638</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/418/' data-id='418' title='Plasma 5 Widgets'><span class='cat-title'>Plasma 5 Widgets</span> <span class='product-counter'>114</span> </a></span><span id='418' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/105/' data-id='105' title='Plasma 5 Add-Ons'><span class='cat-title'>Plasma 5 Add-Ons</span> <span class='product-counter'>74</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/463/' data-id='463' title='Plasma 5 Calendars'><span class='cat-title'>Plasma 5 Calendars</span> <span class='product-counter'>5</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/399/' data-id='399' title='Plasma 5 Clocks'><span class='cat-title'>Plasma 5 Clocks</span> <span class='product-counter'>9</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/398/' data-id='398' title='Plasma 5 Menus'><span class='cat-title'>Plasma 5 Menus</span> <span class='product-counter'>6</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/425/' data-id='425' title='Plasma 5 Monitoring'><span class='cat-title'>Plasma 5 Monitoring</span> <span class='product-counter'>10</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/420/' data-id='420' title='Plasma 5 Multimedia'><span class='cat-title'>Plasma 5 Multimedia</span> <span class='product-counter'>8</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/424/' data-id='424' title='Plasma 5 Weather'><span class='cat-title'>Plasma 5 Weather</span> <span class='product-counter'>2</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/155/' data-id='155' title='Plasma Comic Sources'><span class='cat-title'>Plasma Comic Sources</span> <span class='product-counter'>195</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/419/' data-id='419' title='Plasma Wallpaper Plugins'><span class='cat-title'>Plasma Wallpaper Plugins</span> <span class='product-counter'>7</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/157/' data-id='157' title='Various KDE 1.-4. Improvements'><span class='cat-title'>Various KDE 1.-4. Improvements</span> <span class='product-counter'>788</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/422/' data-id='422' title='Various Plasma 5 Improvements'><span class='cat-title'>Various Plasma 5 Improvements</span> <span class='product-counter'>18</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/464/' data-id='464' title='Various Stuff'><span class='cat-title'>Various Stuff</span> <span class='product-counter'>744</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/381/' data-id='381' title='Desktop Themes'><span class='cat-title'>Desktop Themes</span> <span class='product-counter'>13689</span> </a></span><span id='381' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/266/' data-id='266' title='Be-Shell/Bespin'><span class='cat-title'>Be-Shell/Bespin</span> <span class='product-counter'>75</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/133/' data-id='133' title='Cinnamon Themes'><span class='cat-title'>Cinnamon Themes</span> <span class='product-counter'>306</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/294/' data-id='294' title='Enlightenment'><span class='cat-title'>Enlightenment</span> <span class='product-counter'>375</span> </a></span><span id='294' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/168/' data-id='168' title='E Animated Backgrounds'><span class='cat-title'>E Animated Backgrounds</span> <span class='product-counter'>45</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/167/' data-id='167' title='E Enlightenment Backgrounds'><span class='cat-title'>E Enlightenment Backgrounds</span> <span class='product-counter'>77</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/166/' data-id='166' title='E Entrance Themes'><span class='cat-title'>E Entrance Themes</span> <span class='product-counter'>18</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/173/' data-id='173' title='E Modules'><span class='cat-title'>E Modules</span> <span class='product-counter'>2</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/145/' data-id='145' title='Enlightenment Themes'><span class='cat-title'>Enlightenment Themes</span> <span class='product-counter'>233</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/366/' data-id='366' title='Gnome/GTK'><span class='cat-title'>Gnome/GTK</span> <span class='product-counter'>5963</span> </a></span><span id='366' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/200/' data-id='200' title='Gnome 2 Color Schemes'><span class='cat-title'>Gnome 2 Color Schemes</span> <span class='product-counter'>33</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/130/' data-id='130' title='Gnome 2 Splash Screens'><span class='cat-title'>Gnome 2 Splash Screens</span> <span class='product-counter'>872</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/134/' data-id='134' title='Gnome Shell Themes'><span class='cat-title'>Gnome Shell Themes</span> <span class='product-counter'>364</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/284/' data-id='284' title='GTK1 Themes'><span class='cat-title'>GTK1 Themes</span> <span class='product-counter'>22</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/136/' data-id='136' title='GTK2 Themes'><span class='cat-title'>GTK2 Themes</span> <span class='product-counter'>3742</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/135/' data-id='135' title='GTK3 Themes'><span class='cat-title'>GTK3 Themes</span> <span class='product-counter'>930</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/223/' data-id='223' title='KDE 2 Themes'><span class='cat-title'>KDE 2 Themes</span> <span class='product-counter'>65</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/385/' data-id='385' title='KDE 3 Themes'><span class='cat-title'>KDE 3 Themes</span> <span class='product-counter'>3776</span> </a></span><span id='385' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/230/' data-id='230' title='KDE 3 Color Schemes'><span class='cat-title'>KDE 3 Color Schemes</span> <span class='product-counter'>740</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/315/' data-id='315' title='KDE 3 Domino Styles'><span class='cat-title'>KDE 3 Domino Styles</span> <span class='product-counter'>17</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/224/' data-id='224' title='KDE 3.0-3.4 Themes'><span class='cat-title'>KDE 3.0-3.4 Themes</span> <span class='product-counter'>137</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/172/' data-id='172' title='KDE 3.5 Themes'><span class='cat-title'>KDE 3.5 Themes</span> <span class='product-counter'>365</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/221/' data-id='221' title='KDE 3.x Splash Screens'><span class='cat-title'>KDE 3.x Splash Screens</span> <span class='product-counter'>2517</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/365/' data-id='365' title='KDE Plasma'><span class='cat-title'>KDE Plasma</span> <span class='product-counter'>2197</span> </a></span><span id='365' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/111/' data-id='111' title='KDE 4 Splashscreens'><span class='cat-title'>KDE 4 Splashscreens</span> <span class='product-counter'>491</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/112/' data-id='112' title='Plasma Color Schemes'><span class='cat-title'>Plasma Color Schemes</span> <span class='product-counter'>1279</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/121/' data-id='121' title='Plasma Look-and-Feel Packs'><span class='cat-title'>Plasma Look-and-Feel Packs</span> <span class='product-counter'>20</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/488/' data-id='488' title='Plasma Splashscreens'><span class='cat-title'>Plasma Splashscreens</span> <span class='product-counter'>16</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/104/' data-id='104' title='Plasma Themes'><span class='cat-title'>Plasma Themes</span> <span class='product-counter'>380</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/421/' data-id='421' title='Various Plasma Styles'><span class='cat-title'>Various Plasma Styles</span> <span class='product-counter'>11</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/123/' data-id='123' title='Kvantum'><span class='cat-title'>Kvantum</span> <span class='product-counter'>28</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/446/' data-id='446' title='LXQt Themes'><span class='cat-title'>LXQt Themes</span> <span class='product-counter'>2</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/119/' data-id='119' title='QtCurve'><span class='cat-title'>QtCurve</span> <span class='product-counter'>540</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/120/' data-id='120' title='Various KDE 1.-4. Styles'><span class='cat-title'>Various KDE 1.-4. Styles</span> <span class='product-counter'>362</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/277/' data-id='277' title='Docks and Launchers'><span class='cat-title'>Docks and Launchers</span> <span class='product-counter'>1413</span> </a></span><span id='277' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/275/' data-id='275' title='AWN Themes'><span class='cat-title'>AWN Themes</span> <span class='product-counter'>157</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/274/' data-id='274' title='Cairo-Dock Themes'><span class='cat-title'>Cairo-Dock Themes</span> <span class='product-counter'>31</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/276/' data-id='276' title='DockbarX Themes'><span class='cat-title'>DockbarX Themes</span> <span class='product-counter'>33</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/272/' data-id='272' title='Docky Themes'><span class='cat-title'>Docky Themes</span> <span class='product-counter'>53</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/127/' data-id='127' title='GnoMenu Skins'><span class='cat-title'>GnoMenu Skins</span> <span class='product-counter'>461</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/177/' data-id='177' title='Kbfx Startmenu'><span class='cat-title'>Kbfx Startmenu</span> <span class='product-counter'>461</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/285/' data-id='285' title='Kicker Panel'><span class='cat-title'>Kicker Panel</span> <span class='product-counter'>169</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/475/' data-id='475' title='KXDocker'><span class='cat-title'>KXDocker</span> <span class='product-counter'>19</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/417/' data-id='417' title='Latte Layouts'><span class='cat-title'>Latte Layouts</span> <span class='product-counter'>4</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/273/' data-id='273' title='Plank Themes'><span class='cat-title'>Plank Themes</span> <span class='product-counter'>25</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/103/' data-id='103' title='Fonts'><span class='cat-title'>Fonts</span> <span class='product-counter'>123</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/386/' data-id='386' title='Icons'><span class='cat-title'>Icons</span> <span class='product-counter'>5096</span> </a></span><span id='386' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/113/' data-id='113' title='Emoticons'><span class='cat-title'>Emoticons</span> <span class='product-counter'>129</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/132/' data-id='132' title='Icon Themes'><span class='cat-title'>Icon Themes</span> <span class='product-counter'>1304</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/199/' data-id='199' title='Individual Icons/-sets'><span class='cat-title'>Individual Icons/-sets</span> <span class='product-counter'>3371</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/197/' data-id='197' title='Logos'><span class='cat-title'>Logos</span> <span class='product-counter'>292</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/146/' data-id='146' title='Login Managers'><span class='cat-title'>Login Managers</span> <span class='product-counter'>3153</span> </a></span><span id='146' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/131/' data-id='131' title='GDM Themes'><span class='cat-title'>GDM Themes</span> <span class='product-counter'>2100</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/181/' data-id='181' title='KDM3 Themes'><span class='cat-title'>KDM3 Themes</span> <span class='product-counter'>479</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/100/' data-id='100' title='KDM4 Themes'><span class='cat-title'>KDM4 Themes</span> <span class='product-counter'>411</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/154/' data-id='154' title='LightDM Themes'><span class='cat-title'>LightDM Themes</span> <span class='product-counter'>4</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/153/' data-id='153' title='MDM Themes'><span class='cat-title'>MDM Themes</span> <span class='product-counter'>136</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/101/' data-id='101' title='SDDM Login Themes'><span class='cat-title'>SDDM Login Themes</span> <span class='product-counter'>23</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/231/' data-id='231' title='Screensavers'><span class='cat-title'>Screensavers</span> <span class='product-counter'>61</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/225/' data-id='225' title='Screenshots'><span class='cat-title'>Screenshots</span> <span class='product-counter'>5536</span> </a></span><span id='225' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/454/' data-id='454' title='Budgie Screenshots'><span class='cat-title'>Budgie Screenshots</span> <span class='product-counter'></span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/227/' data-id='227' title='Cinnamon Screenshots'><span class='cat-title'>Cinnamon Screenshots</span> <span class='product-counter'>77</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/453/' data-id='453' title='Deepin Screenshots'><span class='cat-title'>Deepin Screenshots</span> <span class='product-counter'>1</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/459/' data-id='459' title='Elementary Screenshots'><span class='cat-title'>Elementary Screenshots</span> <span class='product-counter'>6</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/458/' data-id='458' title='Enlightenment Screenshots'><span class='cat-title'>Enlightenment Screenshots</span> <span class='product-counter'>9</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/455/' data-id='455' title='Fluxbox Screenshots'><span class='cat-title'>Fluxbox Screenshots</span> <span class='product-counter'>13</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/257/' data-id='257' title='Gnome Screenshots'><span class='cat-title'>Gnome Screenshots</span> <span class='product-counter'>1959</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/457/' data-id='457' title='IceWM Screenshots'><span class='cat-title'>IceWM Screenshots</span> <span class='product-counter'>3</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/456/' data-id='456' title='LXDE/LXQt Screenshots'><span class='cat-title'>LXDE/LXQt Screenshots</span> <span class='product-counter'>4</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/452/' data-id='452' title='Mate Screenshots'><span class='cat-title'>Mate Screenshots</span> <span class='product-counter'>3</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/461/' data-id='461' title='Openbox Screenshots'><span class='cat-title'>Openbox Screenshots</span> <span class='product-counter'>2</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/228/' data-id='228' title='Plasma/KDE Screenshots'><span class='cat-title'>Plasma/KDE Screenshots</span> <span class='product-counter'>3149</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/226/' data-id='226' title='Unity Screenshots'><span class='cat-title'>Unity Screenshots</span> <span class='product-counter'>61</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/258/' data-id='258' title='Window-Manager Screenshots'><span class='cat-title'>Window-Manager Screenshots</span> <span class='product-counter'>85</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/256/' data-id='256' title='XFCE Screenshots'><span class='cat-title'>XFCE Screenshots</span> <span class='product-counter'>163</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/316/' data-id='316' title='System Sounds'><span class='cat-title'>System Sounds</span> <span class='product-counter'>187</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/147/' data-id='147' title='Window Managers'><span class='cat-title'>Window Managers</span> <span class='product-counter'>6531</span> </a></span><span id='147' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/114/' data-id='114' title='Aurorae Themes'><span class='cat-title'>Aurorae Themes</span> <span class='product-counter'>172</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/117/' data-id='117' title='Beryl/Emerald Themes'><span class='cat-title'>Beryl/Emerald Themes</span> <span class='product-counter'>1812</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/267/' data-id='267' title='Compiz'><span class='cat-title'>Compiz</span> <span class='product-counter'>420</span> </a></span><span id='267' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/116/' data-id='116' title='Compiz Themes'><span class='cat-title'>Compiz Themes</span> <span class='product-counter'>306</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/171/' data-id='171' title='Cubecaps'><span class='cat-title'>Cubecaps</span> <span class='product-counter'>37</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/170/' data-id='170' title='Skydomes'><span class='cat-title'>Skydomes</span> <span class='product-counter'>77</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/118/' data-id='118' title='deKorator Themes'><span class='cat-title'>deKorator Themes</span> <span class='product-counter'>172</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/139/' data-id='139' title='Fluxbox Themes'><span class='cat-title'>Fluxbox Themes</span> <span class='product-counter'>449</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/143/' data-id='143' title='FVWM Themes'><span class='cat-title'>FVWM Themes</span> <span class='product-counter'>23</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/142/' data-id='142' title='Ice-WM Themes'><span class='cat-title'>Ice-WM Themes</span> <span class='product-counter'>423</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/169/' data-id='169' title='KDE 3.x Window Decorations'><span class='cat-title'>KDE 3.x Window Decorations</span> <span class='product-counter'>236</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/349/' data-id='349' title='KWin'><span class='cat-title'>KWin</span> <span class='product-counter'>55</span> </a></span><span id='349' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/209/' data-id='209' title='Kwin Effects'><span class='cat-title'>Kwin Effects</span> <span class='product-counter'>6</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/210/' data-id='210' title='Kwin Scripts'><span class='cat-title'>Kwin Scripts</span> <span class='product-counter'>40</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/211/' data-id='211' title='Kwin Switching Layouts'><span class='cat-title'>Kwin Switching Layouts</span> <span class='product-counter'>9</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/125/' data-id='125' title='Metacity Themes'><span class='cat-title'>Metacity Themes</span> <span class='product-counter'>796</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/140/' data-id='140' title='Openbox Themes'><span class='cat-title'>Openbox Themes</span> <span class='product-counter'>808</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/141/' data-id='141' title='Pek-WM Themes'><span class='cat-title'>Pek-WM Themes</span> <span class='product-counter'>192</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/144/' data-id='144' title='Window-Maker Themes'><span class='cat-title'>Window-Maker Themes</span> <span class='product-counter'>55</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/138/' data-id='138' title='XFCE/XFWM4 Themes'><span class='cat-title'>XFCE/XFWM4 Themes</span> <span class='product-counter'>918</span> </a></span></li></ul></span></li></ul></span></li><li class='navilink parent'><span class='title'><a class='parent' href='/browse/cat/466/' data-id='466' title='Telephone UI'><span class='cat-title'>Telephone UI</span> <span class='product-counter'>15</span> </a></span></li><li class='navilink parent'><span class='title'><a class='parent' href='/browse/cat/403/' data-id='403' title='Tutorials'><span class='cat-title'>Tutorials</span> <span class='product-counter'>22</span> </a></span></li><li class='navilink parent'><span class='title'><a class='parent' href='/browse/cat/445/' data-id='445' title='UI Concepts'><span class='cat-title'>UI Concepts</span> <span class='product-counter'>39</span> </a></span></li><li class='navilink parent'><span class='title'><a class='parent' href='/browse/cat/295/' data-id='295' title='Wallpapers'><span class='cat-title'>Wallpapers</span> <span class='product-counter'>79825</span> </a></span><span id='295' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/296/' data-id='296' title='Abstract'><span class='cat-title'>Abstract</span> <span class='product-counter'>2644</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/297/' data-id='297' title='Animals'><span class='cat-title'>Animals</span> <span class='product-counter'>864</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/307/' data-id='307' title='Beaches and Oceans'><span class='cat-title'>Beaches and Oceans</span> <span class='product-counter'>2145</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/308/' data-id='308' title='Bridges'><span class='cat-title'>Bridges</span> <span class='product-counter'>178</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/304/' data-id='304' title='Buildings'><span class='cat-title'>Buildings</span> <span class='product-counter'>182</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/401/' data-id='401' title='Cars'><span class='cat-title'>Cars</span> <span class='product-counter'>61</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/305/' data-id='305' title='Landscapes'><span class='cat-title'>Landscapes</span> <span class='product-counter'>651</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/313/' data-id='313' title='Manga and Anime'><span class='cat-title'>Manga and Anime</span> <span class='product-counter'>64</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/444/' data-id='444' title='Mobile Phones'><span class='cat-title'>Mobile Phones</span> <span class='product-counter'>5</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/306/' data-id='306' title='Mountains'><span class='cat-title'>Mountains</span> <span class='product-counter'>636</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/298/' data-id='298' title='Nature'><span class='cat-title'>Nature</span> <span class='product-counter'>8246</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/261/' data-id='261' title='OS specific'><span class='cat-title'>OS specific</span> <span class='product-counter'>13990</span> </a></span><span id='261' class='collapse'><ul id='cat-tree' class='naviblock child'><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/289/' data-id='289' title='Wallpapers Arch'><span class='cat-title'>Wallpapers Arch</span> <span class='product-counter'>481</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/314/' data-id='314' title='Wallpapers BSD'><span class='cat-title'>Wallpapers BSD</span> <span class='product-counter'>122</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/303/' data-id='303' title='Wallpapers Debian'><span class='cat-title'>Wallpapers Debian</span> <span class='product-counter'>1600</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/451/' data-id='451' title='Wallpapers Deepin'><span class='cat-title'>Wallpapers Deepin</span> <span class='product-counter'>5</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/290/' data-id='290' title='Wallpapers Fedora'><span class='cat-title'>Wallpapers Fedora</span> <span class='product-counter'>169</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/310/' data-id='310' title='Wallpapers Firefox'><span class='cat-title'>Wallpapers Firefox</span> <span class='product-counter'>75</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/293/' data-id='293' title='Wallpapers Frugalware'><span class='cat-title'>Wallpapers Frugalware</span> <span class='product-counter'>169</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/292/' data-id='292' title='Wallpapers Gentoo'><span class='cat-title'>Wallpapers Gentoo</span> <span class='product-counter'>246</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/300/' data-id='300' title='Wallpapers Gnome'><span class='cat-title'>Wallpapers Gnome</span> <span class='product-counter'>1162</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/362/' data-id='362' title='Wallpapers GNU'><span class='cat-title'>Wallpapers GNU</span> <span class='product-counter'>16</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/299/' data-id='299' title='Wallpapers KDE Plasma'><span class='cat-title'>Wallpapers KDE Plasma</span> <span class='product-counter'>1620</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/287/' data-id='287' title='Wallpapers Kubuntu'><span class='cat-title'>Wallpapers Kubuntu</span> <span class='product-counter'>596</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/360/' data-id='360' title='Wallpapers Linux/Tux'><span class='cat-title'>Wallpapers Linux/Tux</span> <span class='product-counter'>65</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/400/' data-id='400' title='Wallpapers LXQt/LXDE'><span class='cat-title'>Wallpapers LXQt/LXDE</span> <span class='product-counter'>24</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/358/' data-id='358' title='Wallpapers Mageia'><span class='cat-title'>Wallpapers Mageia</span> <span class='product-counter'>5</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/291/' data-id='291' title='Wallpapers Mandriva'><span class='cat-title'>Wallpapers Mandriva</span> <span class='product-counter'>405</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/309/' data-id='309' title='Wallpapers Manjaro'><span class='cat-title'>Wallpapers Manjaro</span> <span class='product-counter'>49</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/359/' data-id='359' title='Wallpapers MATE'><span class='cat-title'>Wallpapers MATE</span> <span class='product-counter'>8</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/283/' data-id='283' title='Wallpapers Mint'><span class='cat-title'>Wallpapers Mint</span> <span class='product-counter'>2067</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/312/' data-id='312' title='Wallpapers OSX/Apple'><span class='cat-title'>Wallpapers OSX/Apple</span> <span class='product-counter'>24</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/350/' data-id='350' title='Wallpapers PCLinuxOS'><span class='cat-title'>Wallpapers PCLinuxOS</span> <span class='product-counter'>173</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/361/' data-id='361' title='Wallpapers Solus'><span class='cat-title'>Wallpapers Solus</span> <span class='product-counter'>32</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/288/' data-id='288' title='Wallpapers SUSE'><span class='cat-title'>Wallpapers SUSE</span> <span class='product-counter'>364</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/286/' data-id='286' title='Wallpapers Ubuntu'><span class='cat-title'>Wallpapers Ubuntu</span> <span class='product-counter'>4172</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/311/' data-id='311' title='Wallpapers Windows'><span class='cat-title'>Wallpapers Windows</span> <span class='product-counter'>133</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/302/' data-id='302' title='Wallpapers XFCE/Xubuntu'><span class='cat-title'>Wallpapers XFCE/Xubuntu</span> <span class='product-counter'>171</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/374/' data-id='374' title='Wallpapers Zorin'><span class='cat-title'>Wallpapers Zorin</span> <span class='product-counter'>37</span> </a></span></li></ul></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/301/' data-id='301' title='People'><span class='cat-title'>People</span> <span class='product-counter'>147</span> </a></span></li><li class='navilink child'><span class='title'><a class='child' href='/browse/cat/58/' data-id='58' title='Wallpaper Other'><span class='cat-title'>Wallpaper Other</span> <span class='product-counter'>50012</span> </a></span></li></ul></span></li></ul>            </div>
    </div>
</div>
<script type="application/javascript">
    $(document).ready(function(){
        var hierarchy = (function () {
            return {
                setup: function (cat_id) {
                    $('#cat-tree').find('[data-id='+cat_id+']').addClass('active').parents('li').addClass('active').parents('span.collapse').addClass('in');
                    $('#cat-tree').find('[data-id='+cat_id+']').parent().siblings('span.collapse').addClass('in');
                }
            }
        })();

        hierarchy.setup(324);
    });
</script>          
            </div>

            <div class="flex-item-16 " id="product-main">
                <div class="flex-row imgsmall" id="product-main-img-container">
                    <div class="product-main-img flex-item-24" id="product-main-img">
                        <div id="product-title-div" class="product-title-div">
                            <div  class="product-title">
                            <div class="product-logo-container">
                                  <img class="logo" src="https://cn.pling.com/cache/85x85-crop/img//hive/content-pre1/149909-1.jpeg"/>
                                </div>
                                <div style="margin-left: 95px">
                                    <p style="margin-bottom: 0px">
                                                                             Youtube playlist                                                                        
                                    
                                    <p class="product_category" style="margin-bottom: 5px">                                                
                                    <a href="/browse/cat/324/order/latest">VLC Playlist Parsers </a>                        

                                    <span class="topics"><span class="topicslink"></span><!--end of topicslink--></span>                                    
                                    <p class="light small">
                                    <span class="source">Source: </span>
                                                                        
                                 
                                </div>
                            </div>
                          
                            <div class="product-title-right" >
                                    <div class="projectdtailHeart">
                                        <div id="container-follow1154080">     
                                        <div role="button" class="partialbuttonheartdetail" role="button" data-fragment=""   data-target="#container-follow1154080" data-href="/p/1154080/followp/" data-auth=""><i class="fa fa-heart-o heartgrey " aria-hidden="true" role="button" data-fragment=""   data-target="#container-follow1154080" data-href="/p/1154080/followp/" data-auth=""></i><span class="heartnumber heartnumberpurple small  " >17</span></div>

                                
                                        </div>  
                                                      
                                    </div>
                                    
                                    <div class="projectdetailRating" style="clear: right">
                                    <div id="widget-rating" class="prod-widget-box right" style="border:0px !important">
    <!--<h4 id="extra-products-heading" class="small upcase sidebar-heading">Vote for this product</h4>-->

    <table cellpadding="0" cellspacing="0" width="100%">
        <tbody>
        <tr>
            <td width="10%" class="text-center">
                <a class="btn btn-danger partial votedown "                
                   role="button"
                   style="line-height:10px;"                   
                   data-target="#widget-rating"
                   data-fragment="#widget-rating > *">
                    <span class="fa fa-minus" aria-hidden="true"></span>
                </a>
                 
            </td>
            <td style="padding-left:0.2em;padding-right: 0.2em;">
                <div class="rating">
                    <div class="rating-text">
                        <small class="center-block text-center">Score 81%

                        </small>
                    </div>
                    <div class="progress" style="margin-bottom: 0;height:12px;background-color: transparent; box-shadow: none; padding:2px;">
                        <div class="progress-bar" style="background-color: #4cc84c;width: 81%;">
                            
                        </div>
                        <div class="progress-bar" style="background-color:#eeeeee;width: 19%;">
                          
                        </div>
                    </div>
                </div>
            </td>
            <td width="10%" class="text-center">
                <a class="btn btn-success partial voteup  "                 
                   role="button"
                   style="line-height:10px;"
                   data-target="#widget-rating"
                   data-fragment="#widget-rating > *">
                    <span class="fa fa-plus" aria-hidden="true"></span>
                </a>
               
            </td>
        </tr>
        </tbody>
    </table>
</div>
                                    </div>
                            </div>
                        </div>
                        <div id="carouselContainer" class="carouselContainer">
                            <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">

                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    
                                                                                <li data-target="#myCarousel" data-slide-to="1"
                                                class=""></li>
                                                                            </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">

                                    
                                                                            <div class="item ">
                                            <img src="https://cn.pling.com/img//hive/content-pre1/149909-1.jpeg"/>
                                        </div>
                                                                        </div><!-- End Carousel Inner -->

                                <!-- Controls -->
                                                            </div><!-- End Carousel -->
                        </div>

                        
                    </div>
                </div>

                <div class="flex-item-24" id="product-tabs-container">
                    <!-- TABS -->
                    <div id="product-tabs" class="pling-nav-tabs">
                        <ul class="nav nav-tabs ">
                            <li class="active"><a href="#about-panel" data-toggle="tab">Product</a></li>
                            
                            <li><a href="#files-panel" data-toggle="tab">Files <span id="files-counter"></span></a></li>
                                                    <li><a href="#updates-panel" data-toggle="tab">Changelogs (1)</a></li>
                                                                            <li><a href="#ratings-panel" data-toggle="tab">Ratings & Reviews (46)</a></li>
                                                                             <li><a href="#likes-panel" data-toggle="tab">Favs (17)</a></li>
                                                </ul>
                    </div>
                    <!-- /TABS -->

                    <!-- PANELS -->

                    <div class="tab-content row" id="product-panels">

                        <!-- ABOUT -->
                        <div class="tab-pane active" id="about-panel">


                            <div id="product-about" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">

                                <div>
                                    <article>
                                        <b>Description:</b> <br/><br/>
                                        Import a youtube video / playlist into VLC.<br />
<br />
<br />
<strong>INSTALLATION:</strong><br />
- click on the download button below<br />
- when the file appears click on the menu file &gt; save as... of your browser<br />
- put the file in the vlc /lua/playlist folder, by default:<br />
* Windows (all users): %ProgramFiles%\VideoLAN\VLC\lua\playlist\<br />
* Windows (current user): %APPDATA%\vlc\lua\playlist\<br />
* Linux (all users): /usr/lib/vlc/lua/playlist/<br />
* Linux (current user): ~/.local/share/vlc/lua/playlist/<br />
* Mac OS X (all users): /Applications/VLC.app/Contents/MacOS/share/lua/playlist/<br />
(create directories if they don\'t exist)<br />
<strong>/!\</strong> Some browser (Chrome...) may change the file extension for ".txt" instead of ".lua", so make sure you choose "All extensions" in the dialog box when you save the file on your computer.<br />
<br />
<strong>USAGE:</strong><br />
- Copy the URL of the youtube video or playlist (must contain "list=PL...")<br />
- Start VLC, press Ctrl+N, paste the url then click on "Play" (or Alt+P then Enter), the video /playlist should start<br />
<br />
<strong>Troubleshooting:</strong><br />
/!\ <strong>Follow this steps if and only if you have already install the script and it doesn't work.</strong>.<br />
/!\ <strong> for the actual script see the "download" button (playlist_youtube.lua) below</strong>.<br />
If the videos list appears in the Vlc "playlist" view but the videos won't start, follow this steps:<br />
1) delete the file "youtube.luac" in [vlc directory]/lua/playlist directory (ex: c:\Program Files\VideoLAN\VLC\lua\playlist\youtube.luac)<br />
2) get the latest version of thr "youtube" script from here:<br />
<a href="https://raw.githubusercontent.com/videolan/vlc/master/share/lua/playlist/youtube.lua" target="_blank" rel="nofollow">https://raw.githubusercontent.com/videolan/vlc/master/share/lua/playlist/youtube.lua</a><br />
3) place the file in the directory [vlc directory]/lua/playlist (where "youtube.luac" was)<br />
<br />
<strong>/!\/!\/!\ Please do not paste your raw error log here, use a pastebin service like pastebin.com.</strong>                                    </article>


                                    
                                                                                    <article class="lastchangelog">
                                            <b>Last changelog:</b>

                                            <h3 class="product-heading product-update-heading" >
    <span class="small light lightgrey product-update-date"> 6 years ago</span>
</h3>
<p>- display clean video title and thumbnail<br />
- Add support for playlist with 100+ videos<br />
- fix change in youtube playslists</p>
                                            </article>
                                                                            

                                    <!-- comments -->
                                    <div id="product-discussion">
                                        <div>
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="page-header relative">
                <h3 style="line-height: 15px;">
                    <small class="pull-right">
                        <div class="row" style="margin:0;padding: 0;text-align: right;">294 comments</div>
                        <span class="glyphicon glyphicon-refresh spinning" style="display: none"></span> 
<ul class="pagination pagination-sm" style="margin: 0;padding:0;">
    <li class="disabled">
        <a class=""
           href="javascript:;">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
    </li>

                        <li class="active"><a class="paginationPartial" href="https://www.opendesktop.org/c/1473753829">1</a>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">2</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">3</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">4</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">5</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">6</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">7</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">8</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">9</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">10</a></li>
            
    <li class="">
        <a class="paginationPartial"
           href="https://www.opendesktop.org/c/1473753829">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </li>
</ul>
<script type="application/javascript">
    $(document).ready(function () {
        $('body').off('click', 'ul.pagination a.paginationPartial').on('click', 'ul.pagination a.paginationPartial',function(event) {
                event.preventDefault();
                var target = 'div#product-discussion';            
                var url = $(this).attr("href") + ' ' + target + ' > *';   
                $('html, body').scrollTop($(target).offset().top);    
                $('.glyphicon.glyphicon-refresh.spinning').show();
                $(target).load(url, function (response, status, xhr) {
                    if (status == "error") {
                        $(target).empty().html('Service is temporarily unavailable. Our engineers are working quickly to resolve this issue. <br/>Find out why you may have encountered this error.');
                    }
                     ProductDetailCommentTooltip.setup();      
                });          
                return false;
           });         
    });
</script>
</small>
                    Comments
                </h3>
                                    <p style="position: absolute; top:25px;">
                        <small class="small"><span class="glyphicon glyphicon-share-alt"></span> Please <a href="/login?redirect=NXd5nJ5hp9LrhH4_fO6Ke5xMsxTzGqFLZMB2Fl2O-vqDOmokR5ULVd7k25nJqMsi">login</a> or <a href="/register">register</a> to add a comment</a></small>
                    </p>
                            </div>
            <div class="comments-list"><a name="comments_block"></a>
                                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/494698/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/5/0/5/a/938c87b9454cafd28db205a1d58168b6e9b8.png" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="494698" href="http://opendesktop.org/member/494698/"> m0rtadelo </a>                              

                                <p class="pull-right history" >
                                                                        <small>5 <span class="light">days ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Doesn't work on Mac 2.2.8</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1449245" role="button" href="#report-1449245">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1449245" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1449245-message">
                                        <input type="hidden" name="i" value="1449245">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1449245-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/494080/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/4/3/e/2/b9da63dad7b7a5f81cb23aaa4fd472b4e896.png" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="494080" href="http://opendesktop.org/member/494080/"> esbrinartot </a>                              

                                <p class="pull-right history" >
                                                                        <small>12 <span class="light">days ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Doesn't work. Only works with a single video. I use Debian testing and I'm using the versión 3.0.1</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1449068" role="button" href="#report-1449068">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1449068" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1449068-message">
                                        <input type="hidden" name="i" value="1449068">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1449068-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/444727/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/d/1/0/c/67d714eafed68cb9de06716d20307de5afe0.png" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="444727" href="http://opendesktop.org/member/444727/"> todoesnormal </a>                              

                                <p class="pull-right history" >
                                                                        <small>16 <span class="light">days ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">EXEBETCHE, please, upgrade to VLCx64 3.0.1 on Windows10 x64. Don't work</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1448943" role="button" href="#report-1448943">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1448943" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1448943-message">
                                        <input type="hidden" name="i" value="1448943">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1448943-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/491864/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/9/b/d/8/28c54e44421b2dd71d964556ec4814cfee19.jpg" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="491864" href="http://opendesktop.org/member/491864/"> LyrielAlkimie </a>                              

                                <p class="pull-right history" >
                                                                        <small>18 <span class="light">days ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Only work with a single video, not work with playlist.</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1448881" role="button" href="#report-1448881">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1448881" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1448881-message">
                                        <input type="hidden" name="i" value="1448881">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1448881-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/491195/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://avatars0.githubusercontent.com/u/16577362?v=4" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="491195" href="http://opendesktop.org/member/491195/"> bukijung </a>                              

                                <p class="pull-right history" >
                                                                        <small>1 <span class="light">month ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Don't Work!!  Up Date  Please.. </div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1442710" role="button" href="#report-1442710">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1442710" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1442710-message">
                                        <input type="hidden" name="i" value="1442710">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1442710-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/488022/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/a/7/f/9/513689ba92fe2c45dad5b7dadacce5ac918d.jpg" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="488022" href="http://opendesktop.org/member/488022/"> (L)Aloha </a>                              

                                <p class="pull-right history" >
                                                                        <small>2 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Upgrade the VLC defult plugin allows play again the playlists:<br />
  eg http://youtube.com/playlist?list=PL6dFtv5p3AFdo7Rf9wc30suXID3L5du8W<br />
Restriction: the YouTube download only links of 100 videos first, so this plugin load only this first 100! (further development: it to handle this.)<br />
<br />
+ more feature: you can use the autonextplay parameter in the video link for Play Next Video Automatically function (as neverending story! :)<br />
  eg http://youtu.be/KKLT_0qavoU?autonextplay<br />
  eg https://www.youtube.com/watch?v=KKLT_0qavoU&amp;autonextplay<br />
<br />
Download the<br />
https://raw.githubusercontent.com/l-aloha/vlc_youtubeplaylist/master/youtube.lua<br />
 ... and enjoy the silence!<br />
(Tested with current latest 2.2.6 VLC release on Win 7 x64 and Windows XP x86.)</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1441684" role="button" href="#report-1441684">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1441684" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1441684-message">
                                        <input type="hidden" name="i" value="1441684">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1441684-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:30px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/488453/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/1/8/c/2/b80ca10aed8772932f6370aedda078d79388.png" class="img2">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="488453" href="http://opendesktop.org/member/488453/"> LePrinceCeleste </a>                              

                                <p class="pull-right history" >
                                                                        <small>2 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Thank you very much (L)Aloha!<br />
Your plugin works on my PC! <br />
<br />
The BIG deception is that only first 100 videos links are downloaded... :(((((( <br />
<br />
I have a playlist with more than 200 videos... <br />
So...have to wait further development...</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1441817" role="button" href="#report-1441817">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1441817" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1441817-message">
                                        <input type="hidden" name="i" value="1441817">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1441817-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:30px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/490233/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://avatars0.githubusercontent.com/u/24243683?v=4" class="img2">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="490233" href="http://opendesktop.org/member/490233/"> blueicehaller </a>                              

                                <p class="pull-right history" >
                                                                        <small>1 <span class="light">month ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Hello,<br />
for me it doesn't work. VLC 2.2.8 32 and 64 bit.<br />
It shows me: http error: error: HTTP/1.1 403 Forbidden<br />
<br />
Thank you in advance.</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1442390" role="button" href="#report-1442390">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1442390" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1442390-message">
                                        <input type="hidden" name="i" value="1442390">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1442390-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:60px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/490233/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://avatars0.githubusercontent.com/u/24243683?v=4" class="img3">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="490233" href="http://opendesktop.org/member/490233/"> blueicehaller </a>                              

                                <p class="pull-right history" >
                                                                        <small>1 <span class="light">month ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Do I need to compile the playlist.lua to playlist.luac first?<br />
What is the usage of youtube_homepage.luac ?</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1442391" role="button" href="#report-1442391">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1442391" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1442391-message">
                                        <input type="hidden" name="i" value="1442391">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1442391-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:90px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/490233/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://avatars0.githubusercontent.com/u/24243683?v=4" class="img4">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="490233" href="http://opendesktop.org/member/490233/"> blueicehaller </a>                              

                                <p class="pull-right history" >
                                                                        <small>1 <span class="light">month ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">https://github.com/videolan/vlc/blob/master/share/lua/intf/luac.lua#L14<br />
usage = <br />
[[<br />
To compile a lua script to bytecode (luac) run:<br />
  vlc -I luaintf --lua-intf --lua-config 'luac={input="file.lua",output="file.luac"}'<br />
Output will be similar to that of the luac command line tool provided with lua with the following arguments:<br />
  luac -o file.luac file.lua<br />
]]</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1442392" role="button" href="#report-1442392">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1442392" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1442392-message">
                                        <input type="hidden" name="i" value="1442392">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1442392-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:120px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/486041/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/9/e/3/7/44ece9a3cd2c3a3fa90ccb88369a38eaff48.png" class="img5">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="486041" href="http://opendesktop.org/member/486041/"> cpu1100 </a>                              

                                <p class="pull-right history" >
                                                                        <small>17 <span class="light">days ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Hey Blueice,<br />
<br />
Were you able to fix the "HTTP/1.1 403 Forbidden" error using the updated plugin? or any other way? I am still getting the 403 error.<br />
</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1448916" role="button" href="#report-1448916">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1448916" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1448916-message">
                                        <input type="hidden" name="i" value="1448916">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1448916-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/486041/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/9/e/3/7/44ece9a3cd2c3a3fa90ccb88369a38eaff48.png" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="486041" href="http://opendesktop.org/member/486041/"> cpu1100 </a>                              

                                <p class="pull-right history" >
                                                                        <small>3 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Unfortunately, this add-on stopped working (showing only one item).<br />
<br />
As a workaround, you can do it manually:<br />
1. Open your playlist page in Youtube. e.g. https://www.youtube.com/playlist?list=XXXX<br />
2. Open the source code of page. If you dont know how, google "open source code of page in "<br />
3. Select all texts (using Ctrl-A) and paste it to a text editor. Notepad ++ is a good option here: https://notepad-plus-plus.org<br />
4. Find the line containing  {"url":"/watch?v=  text. If you dont know how, use the following guide: https://www.youtube.com/watch?v=g3sOIqs1Ifw<br />
5. Replace {"url":"/watch with \nhttps://www.youtube.com/watch. If you dont know how, see: https://www.youtube.com/watch?v=LYzUDmBBIUY&amp;t=108s. This step effectively makes a multiline text file. Each line contains a video URL in your playlist.<br />
6. Now cleanup the file to have only one URL in each line and nothing else. <br />
7. Final step is to add #EXTM3U in the first line of this file.<br />
8. You are done. Just save the text file as My_Playlist.m3u and you can open it on VLC.<br />
<br />
Note: Your final file should look like:<br />
#EXTM3U<br />
https://www.youtube.com/watch?v=XXXXX1<br />
https://www.youtube.com/watch?v=XXXXX2<br />
https://www.youtube.com/watch?v=XXXXX3<br />
<br />
Enjoy!<br />
<br />
</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1441213" role="button" href="#report-1441213">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1441213" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1441213-message">
                                        <input type="hidden" name="i" value="1441213">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1441213-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/482474/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/4/8/f/1/a5f42e50203589a9828f132c2b938df90756.png" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="482474" href="http://opendesktop.org/member/482474/"> dalanglois </a>                              

                                <p class="pull-right history" >
                                                                        <small>4 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">It only works for me with 64-bit version, and starts skipping videos as soon as random order is activated.  What I'll try is let the entire playlist play in normal order, and activate random order when all files got loaded</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1440399" role="button" href="#report-1440399">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1440399" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1440399-message">
                                        <input type="hidden" name="i" value="1440399">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1440399-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/354761/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/2/1/0/e/511fca761d2dfb53bef50a146dfdb049a971.png" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="354761" href="http://opendesktop.org/member/354761/"> Andy2015 </a>                              

                                <p class="pull-right history" >
                                                                        <small>4 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Excellent<br />
</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1440220" role="button" href="#report-1440220">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1440220" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1440220-message">
                                        <input type="hidden" name="i" value="1440220">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1440220-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/477898/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/3/7/5/8/884a164e55c056caeea1d5f104db5d2eb29f.png" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="477898" href="http://opendesktop.org/member/477898/"> CJOR </a>                              

                                <p class="pull-right history" >
                                                                        <small>6 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">It doesn't work in VLC 3.0.0.<br />
VLC only adds the first video without the script. With the script the link is ignored and the videos are not added.<br />
In VLC 3.0.0 the path /usr/lib/vlc/lua/playlist/ has changed, now it's /usr/share/vlc/lua/playlist/</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1438942" role="button" href="#report-1438942">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1438942" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1438942-message">
                                        <input type="hidden" name="i" value="1438942">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1438942-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/475021/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/4/9/e/0/3fe07502879333aa827f9d9fa06a94be8874.png" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="475021" href="http://opendesktop.org/member/475021/"> Udlan1988 </a>                              

                                <p class="pull-right history" >
                                                                        <small>7 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Doesn't work with watch later playlist :(</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1438136" role="button" href="#report-1438136">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1438136" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1438136-message">
                                        <input type="hidden" name="i" value="1438136">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1438136-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/474009/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/0/6/7/2/bd86bc00fed13730bebef8af8fd611a56959.png" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="474009" href="http://opendesktop.org/member/474009/"> Yaromax </a>                              

                                <p class="pull-right history" >
                                                                        <small>7 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">It worrks with VLC 64-bit, but not with 32-bit.</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1437906" role="button" href="#report-1437906">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1437906" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1437906-message">
                                        <input type="hidden" name="i" value="1437906">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1437906-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/474009/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/0/6/7/2/bd86bc00fed13730bebef8af8fd611a56959.png" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="474009" href="http://opendesktop.org/member/474009/"> Yaromax </a>                              

                                <p class="pull-right history" >
                                                                        <small>7 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">I can get videos in playlist, but they just skip without playing. Windows 7 64bit, VLC 2.2.6 32 bit, youtube.luac deleted.</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1437905" role="button" href="#report-1437905">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1437905" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1437905-message">
                                        <input type="hidden" name="i" value="1437905">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1437905-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/473139/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://avatars2.githubusercontent.com/u/18232535?v=4" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="473139" href="http://opendesktop.org/member/473139/"> gotekus </a>                              

                                <p class="pull-right history" >
                                                                        <small>7 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Excellent</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1437626" role="button" href="#report-1437626">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1437626" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1437626-message">
                                        <input type="hidden" name="i" value="1437626">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1437626-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/470060/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://avatars3.githubusercontent.com/u/20376143?v=3" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="470060" href="http://opendesktop.org/member/470060/"> timfong1015 </a>                              

                                <p class="pull-right history" >
                                                                        <small>8 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">This breaks in the latest 64 bit OS X version of VLC. </div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1436829" role="button" href="#report-1436829">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1436829" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1436829-message">
                                        <input type="hidden" name="i" value="1436829">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1436829-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/467972/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://avatars1.githubusercontent.com/u/5633486?v=3" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="467972" href="http://opendesktop.org/member/467972/"> monckey100 </a>                              

                                <p class="pull-right history" >
                                                                        <small>9 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Here's a fixed version of the plugin playlist, hopefully the author integrates it:<br />
https://pastebin.com/PfW9ZUnZ</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1436278" role="button" href="#report-1436278">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1436278" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1436278-message">
                                        <input type="hidden" name="i" value="1436278">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1436278-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:30px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/472847/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/6/6/8/a/70810be1679775522305e74b260a2a10bc4a.png" class="img2">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="472847" href="http://opendesktop.org/member/472847/"> masaki </a>                              

                                <p class="pull-right history" >
                                                                        <small>7 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">It gracefully works! Thanks!</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1437538" role="button" href="#report-1437538">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1437538" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1437538-message">
                                        <input type="hidden" name="i" value="1437538">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1437538-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:30px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/480525/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/e/0/9/0/dd5b9cb7445bb3a02ab427b0623a5b470755.png" class="img2">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="480525" href="http://opendesktop.org/member/480525/"> tml3nr </a>                              

                                <p class="pull-right history" >
                                                                        <small>5 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Many thanks to monckey100. It's work fine on VLC 2.26 32bit!</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1439935" role="button" href="#report-1439935">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1439935" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1439935-message">
                                        <input type="hidden" name="i" value="1439935">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1439935-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/466493/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/1/0/4/8/1a75a1a2f7f2576dc2f7749d08151c774f08.png" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="466493" href="http://opendesktop.org/member/466493/"> Musame </a>                              

                                <p class="pull-right history" >
                                                                        <small>10 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Works with the newest 64bit version of VLC.</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1435862" role="button" href="#report-1435862">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1435862" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1435862-message">
                                        <input type="hidden" name="i" value="1435862">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1435862-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
                    <div class="media" style="margin-left:0px">
                    
                                        <a class="media-left" href="http://opendesktop.org/member/465316/">
                        <div class="profileimage" style="position:relative;display:inline-block;">
                       
                       
                        <img src="https://cn.pling.com/cache/200x200-2/img/e/b/1/a/38738766c6468a6f7fb49d46b39b337fcde6.png" class="img1">
                        </div>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading user_name">
                              
                                  <a  class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="465316" href="http://opendesktop.org/member/465316/"> lrnz0 </a>                              

                                <p class="pull-right history" >
                                                                        <small>10 <span class="light">months ago</span></small>
                                                                    </p>
                        </h4>
                        
                        <div class="text">Thanks a lot!!!</div>
                        <p>
                            <small class="small pull-right">
                                                            <a data-toggle="modal" data-target="#report-1435532" role="button" href="#report-1435532">
                                    <span class="glyphicon glyphicon-alert"></span> Report
                                </a>
                            </small>
                        </p>
                        <div id="report-1435532" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content" style="padding: 10px 10px 0 10px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="comment-report" class="full-width partialjson" action="/report/comment/" data-target="#report-1435532-message">
                                        <input type="hidden" name="i" value="1435532">
                                        <input type="hidden" name="p" value="1154080">
                                        <div id="report-1435532-message">
                                        <p>Do you really want to report this comment?</p>
                                        <div class="modal-footer">
                                            <button type="submit" style="border:none;background: transparent;color: #2673b0; " class="small"><span class="glyphicon glyphicon-share-alt"></span> Yes</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                                            </div>
           </div>
            </div>

                    <div class="row" >
                        <div class="col-lg-12">
                        <small class="pull-right">                         
                        <span class="glyphicon glyphicon-refresh spinning" style="display: none"></span> 
<ul class="pagination pagination-sm" style="margin: 0;padding:0;">
    <li class="disabled">
        <a class=""
           href="javascript:;">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
    </li>

                        <li class="active"><a class="paginationPartial" href="https://www.opendesktop.org/c/1473753829">1</a>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">2</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">3</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">4</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">5</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">6</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">7</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">8</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">9</a></li>
                                <li><a  class="ajaxPartial paginationPartial" href="https://www.opendesktop.org/c/1473753829">10</a></li>
            
    <li class="">
        <a class="paginationPartial"
           href="https://www.opendesktop.org/c/1473753829">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </li>
</ul>
<script type="application/javascript">
    $(document).ready(function () {
        $('body').off('click', 'ul.pagination a.paginationPartial').on('click', 'ul.pagination a.paginationPartial',function(event) {
                event.preventDefault();
                var target = 'div#product-discussion';            
                var url = $(this).attr("href") + ' ' + target + ' > *';   
                $('html, body').scrollTop($(target).offset().top);    
                $('.glyphicon.glyphicon-refresh.spinning').show();
                $(target).load(url, function (response, status, xhr) {
                    if (status == "error") {
                        $(target).empty().html('Service is temporarily unavailable. Our engineers are working quickly to resolve this issue. <br/>Find out why you may have encountered this error.');
                    }
                     ProductDetailCommentTooltip.setup();      
                });          
                return false;
           });         
    });
</script>
</small>
                            </div>
                    </div>
        </div>
    </div>
</div>
<div class="tooltip_templates" style="display: none">
    <span id="tooltip_content">
        <i class="fa fa-spinner"></i>
    </span>
</div>
                                    </div>
                                    <!-- /comments -->
                                </div>

                            </div>

                            

                        </div>
                        <!-- /ABOUT -->

                        <!-- MEDIA -->
                        <div class="tab-pane" id="media-panel">
                                                    </div>
                        <!-- /MEDIA -->

                        <!-- updates panel -->
                                                <div class="tab-pane" id="updates-panel">
                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
                            <article>
                                <h3 class="product-heading product-update-heading" >
    <span class="small light lightgrey product-update-date"> 6 years ago</span>
</h3>
<p>- display clean video title and thumbnail<br />
- Add support for playlist with 100+ videos<br />
- fix change in youtube playslists</p>
                            </article>
                            </div>
                        </div>
                        
                        <!-- ratings panel -->
                                                <div class="tab-pane" id="ratings-panel">
                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
                            <article>
                                <div id="productRatingContainer">
                                
<button id="showRatingAll" class="pull-right bbtn btn-default btnRateFilter">Show all Reviews (46)</button>
<button id="showRatingActive" class="pull-right bbtn btn-default btnRateFilter activeRating">Show Active Reviews (46)</button>
<button id="showRatingUpvotes" class="pull-right bbtn btn-default btnRateFilter">Show (50) <span class="glyphicon glyphicon-thumbs-up " style="color:green"> </span></button>
<button id="showRatingDownvotes" class="pull-right bbtn btn-default btnRateFilter">Show (7)  <span class="glyphicon glyphicon-thumbs-down " style="color:red"> </span></button>
<span class="glyphicon glyphicon-refresh spinning" style="float: right; display: none"></span>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/480525/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/200x200-2/img/e/0/9/0/dd5b9cb7445bb3a02ab427b0623a5b470755.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/480525/">
		tml3nr 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Nov 05 2017 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/475336/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/200x200-2/img/2/6/e/c/00accf86635c5ec3c1660c62cc3a5c3a6474.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/475336/">
		aliali2017 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Sep 05 2017 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/473139/">	
	<img class="userimg"  
					src="https://avatars2.githubusercontent.com/u/18232535?v=4"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/473139/">
		gotekus 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Aug 11 2017 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		Excellent 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/471706/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/200x200-2/img/5/1/3/2/4c3979d73e3a634cdec37880a65c66189988.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/471706/">
		latiosFR 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Jul 25 2017 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/466969/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/200x200-2/img/b/d/2/7/c8a7d5f735fd0caccc6f28729f589f965ebd.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/466969/">
		LittleLizzy 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> May 28 2017 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/464841/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/200x200-2/img/9/0/f/b/2aa4367438faa27fba52f184becee04cc0fc.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/464841/">
		ELKZ 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Apr 29 2017 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/463507/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/200x200-2/img/e/9/8/1/cd01ae9f18b1870dd7d28c2fd50abd6e15fc.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/463507/">
		DarkPhoenix1337 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Apr 10 2017 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/456606/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/200x200-2/img/7/b/c/4/626cf5907f889aca18d776488acca27baccd.jpg"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/456606/">
		Stretch 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Dec 27 2016 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/454598/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/200x200-2/img/4/7/3/8/967edbbceafda7f3f4438e6f558dd6677fc7.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/454598/">
		dwmed 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Dec 05 2016 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/446198/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/200x200-2/img/b/c/b/2/6dfa64bde511719b643b7180f27f43b5fdb2.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/446198/">
		BB20101997 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Sep 24 2016 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/373087/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/373087/">
		Ragiowan 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Nov 09 2015 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/370549/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/370549/">
		mcq333 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Sep 17 2015 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/364710/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/364710/">
		99lool 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> May 31 2015 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/363641/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/363641/">
		9207771739 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> May 01 2015 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/156855/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/156855/">
		DJXAKEP 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Apr 25 2015 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/363130/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/363130/">
		ziki 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Apr 21 2015 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/362480/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/362480/">
		dirtyharry85 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Apr 09 2015 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/360186/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/360186/">
		EscapeFromReality 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Mar 03 2015 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/350070/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/350070/">
		tomaszek197871 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Oct 29 2014 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/350096/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/350096/">
		gogo57540 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Sep 08 2014 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/348288/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/348288/">
		Doyouknow 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Jul 31 2014 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/342443/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/342443/">
		rezmen1777 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Apr 24 2014 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/341982/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/341982/">
		ktb007 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Apr 21 2014 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsDownvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/340770/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/340770/">
		Attila13 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Apr 16 2014 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-down o-thumbs-down"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/334614/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/334614/">
		pereov33 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Jan 17 2014 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/329830/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/329830/">
		csuno 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Nov 27 2013 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/328668/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/328668/">
		DFPOWER46 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Nov 18 2013 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/36892/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/36892/">
		Snapafun 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Aug 29 2013 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/314182/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-bigpics/0/DevilinPixy.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/314182/">
		DevilinPixy 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Aug 24 2013 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/309327/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/309327/">
		BurakPatat 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Aug 03 2013 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/236223/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/236223/">
		GuixLe 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Jul 25 2013 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/15586/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/0/legluondunet.jpg"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/15586/">
		legluondunet 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Jul 07 2013 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/230777/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/0/cipricus.jpeg"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/230777/">
		cipricus 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> May 17 2013 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/289781/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/289781/">
		Argyle 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> May 13 2013 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/280775/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/0/ufoasd.jpg"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/280775/">
		ufoasd 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Apr 10 2013 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/277599/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/277599/">
		ringen00 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Apr 04 2013 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/267978/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/267978/">
		zequi 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Feb 12 2013 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/436218/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-bigpics/0/HATRED.jpg"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/436218/">
		HATRED 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Jan 09 2013 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/258543/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/0/equiman.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/258543/">
		equiman 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Nov 30 2012 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/258361/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/258361/">
		btocher 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Nov 27 2012 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/258306/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/258306/">
		hernansilva 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Nov 26 2012 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/88168/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/0/erosenninrho.jpg"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/88168/">
		erosenninrho 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Nov 26 2012 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/258187/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/258187/">
		sirhcits 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Nov 25 2012 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/257658/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/257658/">
		meow9th 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Nov 19 2012 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsUpvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/235902/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/235902/">
		FracExebetche 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date"> Apr 23 2012 </span>
	  <span> <span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span> </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>
<div class="productRating-rows productRating-rows-active  clsDownvotes "  >
	<h3 class="product-heading product-update-heading" >
	<a href="http://opendesktop.org/member/0/">	
	<img class="userimg"  
					src="https://cn.pling.com/cache/40x40/img/hive/user-pics/nopic.png"
	                                                 alt="product-maker" 
	                                                />
    </a>
	<span>	
		<a href="http://opendesktop.org/member/0/">
		 
		</a>
	</span>
	  <span class="small light lightgrey product-update-date">  </span>
	  <span> <span class="glyphicon glyphicon-thumbs-down o-thumbs-down"> </span>6<span class="glyphicon glyphicon-thumbs-up o-thumbs-up"> </span>6 </span>
	</h3>
	<span style="padding-left: 45px">	
		 
	</span>
</div>

                                  </div>
                            </article>
                            </div>
                        </div>
                        
                        <!-- ratings panel -->
                                                <div class="tab-pane" id="likes-panel">
                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
                            <article>
                                <div id="productLikesContainer">
                                                                                                       
         <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/491632/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="491632">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/5/2/d/9/0b20d6e125ded9fd0047bb97aaa19ea376cc.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">sesiu</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Feb 28 2018</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/373234/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="373234">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-pics/nopic.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">mehdih</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Nov 12 2015</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/372261/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="372261">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-pics/nopic.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">s1ckb0y</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Oct 21 2015</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/348288/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="348288">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-pics/nopic.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">Doyouknow</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Jul 31 2014</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/289781/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="289781">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-pics/nopic.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">Argyle</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> May 13 2013</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/277599/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="277599">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-pics/nopic.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">ringen00</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Mar 28 2013</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/436218/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="436218">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-bigpics/0/HATRED.jpg"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">HATRED</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Jan 09 2013</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/60183/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="60183">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-bigpics/0/HATRED.jpg"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">gericom</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Jan 09 2013</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/259984/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="259984">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-pics/nopic.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">gomozan</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Dec 17 2012</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/258767/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="258767">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-pics/nopic.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">gb4lamc</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Dec 03 2012</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/258543/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="258543">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-pics/0/equiman.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">equiman</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Nov 30 2012</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/258397/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="258397">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-pics/nopic.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">tonysilva</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Nov 27 2012</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/258361/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="258361">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-pics/nopic.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">btocher</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Nov 27 2012</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/258187/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="258187">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-pics/nopic.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">sirhcits</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Nov 25 2012</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/257960/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="257960">
                    <figure >
                        <img src="https://cn.pling.com/img/hive/user-bigpics/0/allig8or.gif"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">allig8or</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Nov 22 2012</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/257658/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="257658">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-pics/nopic.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">meow9th</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Nov 19 2012</span>
            </div>
        </div>
        <div class="user " >
            <div class="u-wrap">
                <a  href="http://opendesktop.org/member/235902/" class="tooltipuser"  data-tooltip-content="#tooltip_content" role="button" data-user="235902">
                    <figure >
                        <img src="https://cn.pling.com/cache/200x200-2/img/hive/user-pics/nopic.png"/>
                    </figure>
                    <h3 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">FracExebetche</h3>                                                   
                </a>
                 <span class="small"><i class="fa fa-heart myfav" aria-hidden="true"></i> Apr 23 2012</span>
            </div>
        </div>
<div class="clearboth"></div> 


                                  </div>
                            </article>
                            </div>
                        </div>
                                                
                        <div class="tab-pane" id="files-panel">
                            <div class="col-lg-12">
                                
  <!-- ppload -->
                                       <article>
                     <div id="modal-installation-instructions"
                          class="modal fade"
                          role="dialog"
                          aria-labelledby="modal-installation-instructions-label">
                        <div class="modal-dialog content-modal" style="width: 640px; font-size: 12pt;">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h3 id="modal-installation-instructions-label">Installation Instructions</h3>
                                </div>
                                <div class="modal-body">

                                <iframe src="https://opendesktop.github.io/ocs-url/opendesktoporg-help.html" width="100%" height="500" frameborder="0" seamless id="iframeInstallInstruction"></iframe>
                                </div>
                            </div>
                        </div>
                     </div>

                     <div data-ppload-api-uri="https://dl.opendesktop.org/api/"
                          data-ppload-collection-id="1473753829"
                          data-xdg-type="">

                         <!--
                         <iframe src="" width="0" height="0" frameborder="0"
                                 data-pling-music-uri="/pling-music-html5/embed.html"
                                 seamless></iframe>
                         -->

                         <!--table-bordered-->
                         <table class="table table-ocs-file" data-ppload-files="">
                             <thead>
                             <tr>
                                 <th>File (click to download)</th>
                                 <th>Version</th>
                                 <th>Description</th>
                                 <th>Filetype</th>
                                 <th>Packagetype</th>
                                 <th>License</th>
                                 <th style="text-align: right">Downloads</th>
                                 <th>Date</th>

                                 <th style="text-align: right">Filesize</th>
                                
                                 <th style="text-align: right">DL</th>
                                  <th style="text-align: right;white-space:nowrap">OCS-Install                                     <a href="#modal-installation-instructions" role="button" data-toggle="modal"><span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span></a>
                                 </th>
                                                              </tr>
                             </thead>
                             <tbody></tbody>
                             <tfoot>
                             </tfoot>
                         </table>


                     </div>
                 </article>


                 

             <script type="text/javascript">

                 $(function () {
                     var Base64={_keyStr:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",encode:function(e){var t="";var n,r,i,s,o,u,a;var f=0;e=Base64._utf8_encode(e);while(f<e.length){n=e.charCodeAt(f++);r=e.charCodeAt(f++);i=e.charCodeAt(f++);s=n>>2;o=(n&3)<<4|r>>4;u=(r&15)<<2|i>>6;a=i&63;if(isNaN(r)){u=a=64}else if(isNaN(i)){a=64}t=t+this._keyStr.charAt(s)+this._keyStr.charAt(o)+this._keyStr.charAt(u)+this._keyStr.charAt(a)}return t},decode:function(e){var t="";var n,r,i;var s,o,u,a;var f=0;e=e.replace(/[^A-Za-z0-9\+\/\=]/g,"");while(f<e.length){s=this._keyStr.indexOf(e.charAt(f++));o=this._keyStr.indexOf(e.charAt(f++));u=this._keyStr.indexOf(e.charAt(f++));a=this._keyStr.indexOf(e.charAt(f++));n=s<<2|o>>4;r=(o&15)<<4|u>>2;i=(u&3)<<6|a;t=t+String.fromCharCode(n);if(u!=64){t=t+String.fromCharCode(r)}if(a!=64){t=t+String.fromCharCode(i)}}t=Base64._utf8_decode(t);return t},_utf8_encode:function(e){e=e.replace(/\r\n/g,"\n");var t="";for(var n=0;n<e.length;n++){var r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r)}else if(r>127&&r<2048){t+=String.fromCharCode(r>>6|192);t+=String.fromCharCode(r&63|128)}else{t+=String.fromCharCode(r>>12|224);t+=String.fromCharCode(r>>6&63|128);t+=String.fromCharCode(r&63|128)}}return t},_utf8_decode:function(e){var t="";var n=0;var r=c1=c2=0;while(n<e.length){r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r);n++}else if(r>191&&r<224){c2=e.charCodeAt(n+1);t+=String.fromCharCode((r&31)<<6|c2&63);n+=2}else{c2=e.charCodeAt(n+1);c3=e.charCodeAt(n+2);t+=String.fromCharCode((r&15)<<12|(c2&63)<<6|c3&63);n+=3}}return t}};

                     var $pploadCollection = $('div[data-ppload-collection-id]');
                     var $plingMusic = $pploadCollection.find('iframe[data-pling-music-uri]');
                     var pploadApiUri = $pploadCollection.attr('data-ppload-api-uri');
                     var hasFilesPanelOpened = false;

                     function keysrt(key, asc) {
                         if(asc) {
                              return function(a,b){
                               if (a[key] > b[key]) return 1;
                               if (a[key] < b[key]) return -1;
                               return 0;
                              }
                         } else {
                             return function(a,b){
                                   if (a[key] < b[key]) return 1;
                                   if (a[key] > b[key]) return -1;
                                   return 0;
                             }
                         }
                    }

                    function activeCarouselFirstImg()
                    {
                          $('.carousel-inner .item').first().addClass('active');
                           $('.carousel-indicators > li').first().addClass('active');
                           $( '.carousel-indicators > li').each(function( index ) {
                                $( this ).attr("data-slide-to",index);
                            });
                    }


                     function getPploadFiles(page) {
                          activeCarouselFirstImg();
                          
                         var collectionId = $pploadCollection.attr('data-ppload-collection-id');
                         if (!page) {
                             page = 1;
                         }
                         $.ajax({
                             url: pploadApiUri + 'files/index',
                             type: 'GET',
                             data: {
                                 format: 'json',
                                 ignore_status_code: 1,
                                 status: 'all',
                                 collection_id: collectionId,
                                 perpage: 1000,
                                 page: page
                             },
                             dataType: 'json',
                             success: function (data, textStatus, jqXHR) {
                                 if (data.status != 'success') {
                                    activeCarouselFirstImg();
                                     return;
                                 }

                                 var isPlayable = false;
                                 var fileSizeSum = 0;

                                 var downloaded_count_total = 0;
                                 var firstRow = true;

                                var myArray = $.map(data.files, function(entry) {
                                    return entry;
                                });

                                //myArray = myArray.sortOn('active');
                                myArray.sort(keysrt('active'), false);
                                myArrayActive = [];
                                myArrayInactive = [];
                                $.each(myArray, function () {
                                        if(this.active == '1') {
                                                myArrayActive.push(this);
                                        } else {
                                                myArrayInactive.push(this);
                                        }
                                });

                                //sort
                                myArrayActive.sort(keysrt('created_timestamp'), false);
                                myArrayInactive.sort(keysrt('created_timestamp'), false);

                                var oldestFileId = null;
                                //Active Files
                                 $.each(myArrayActive, function () {
                                    if(firstRow) {
                                        //this.downloaded_count = parseInt(this.downloaded_count) + parseInt(313645);
                                        oldestFileId = this.id;
                                        firstRow = false;
                                    }

                                    if(this.id < oldestFileId) {
                                            oldestFileId = this.id;
                                    }

                                    count_downloads = this.downloaded_count || 0;
                                    downloaded_count_total = downloaded_count_total+parseInt(count_downloads);

                                    //downloadlink is now: domain/api/files/download/id/ID/s/TOKEN/t/TIMESTAMP/FILE_NAME/u/USERID
                                    var hash = '7f374d58d267aa21d077bc30fe8fcb21';
                                    var timetamp = '1522934228';
                                    var userid = '223978';

                                    var downloadUrl = "https://www.opendesktop.org/p/1154080/startdownload?file_id=" + this.id + "&file_name=" + this.name + "&file_type=" + this.type + "&file_size=" + this.size + "&url=" + encodeURIComponent(pploadApiUri + 'files/downloadfile/id/' + this.id + '/s/' + hash + '/t/' + timetamp + '/u/' + userid + '/' + this.name);
                                    var downloadLink = '<a href="' + downloadUrl + '" id="data-link' + this.id + '">' + this.name + '</a>';

                                    /*
                                    var fileNameBtnLink = this.name;
                                    if(fileNameBtnLink.length > 25) {
                                        fileNameBtnLink = fileNameBtnLink.substring(0,22) + '...';
                                    }*/
                                    var downloadBtnLink = downloadUrl;
                                    var downloadLinkFilename = shortFilename(this.name);

                                    if(this.active == '0') {
                                        downloadLink = this.name;
                                    }
                                    var link = '';

                                    var fileDescription = '';
                                    if (this.description) {
                                        fileDescription = this.description;
                                    }
                                     var licenseId = '';
                                     var license = '';
                                     var packagetypeId = '';
                                     if (this.tags) {
                                         fileTags = this.tags;

                                         $.each(fileTags.split(','), function () {

                                             if(this.indexOf("##")==-1) {
                                              var tagStr = this.split('-');
                                              if (tagStr.length == 2 && tagStr[0] == 'os') {
                                                  osId = tagStr[1];
                                              } else if (tagStr.length == 2 && tagStr[0] == 'licensetype') {
                                                  licenseId = tagStr[1];
                                              } else if (tagStr.length == 2 && tagStr[0] == 'packagetypeid') {
                                                  packagetypeId = tagStr[1];
                                              }
                                             } else {
                                              var tagStr = this.split('##');
                                              if (tagStr.length == 2 && tagStr[0] == 'link') {
                                                  link = tagStr[1];
                                              } else if (tagStr.length == 2 && tagStr[0] == 'license') {
                                                  license = tagStr[1];
                                                  license = Base64.decode(license);
                                              } else if (tagStr.length == 2 && tagStr[0] == 'packagetypeid') {
                                                  packagetypeId = tagStr[1];
                                              }
                                             }
                                             /*else if (tagStr.length == 2 && tagStr[0] == 'package') {
                                              packageId = tagStr[1];
                                              }
                                              else if (tagStr.length == 2 && tagStr[0] == 'arch') {
                                              archId = tagStr[1];
                                              }
                                              else if (tagStr.length == 2 && tagStr[0] == 'device') {
                                              deviceId = tagStr[1];
                                              }*/
                                         });
                                     }

                                     var ocsUrl = '';
                                     if (typeof link !== 'undefined' && link) {
                                         ocsUrl = generateOcsUrl(
                                             decodeURIComponent(link),
                                             $pploadCollection.attr('data-xdg-type')
                                         );
                                     } else if (!link) {
                                         ocsUrl = generateOcsUrl(
                                             downloadUrl,
                                             $pploadCollection.attr('data-xdg-type'),
                                             this.name
                                         );
                                     }

                                     var installButton = '';
                                     var installLink = '';
                                     var installLinkFilename = '';

                                     if ( ocsUrl) {
                                            if(this.active && this.ocs_compatible == 1){
                                                installButton = '<a href="' + ocsUrl + '" class="btn btn-native btn-min-width">Install</a>';
                                                installLink = ocsUrl;
                                                installLinkFilename = shortFilename(this.name);

                                            } else {
                                                installButton = '<a href="#" class="btn btn-min-width disabled">INCOMPATIBLE</a>';
                                                installLink = '';
                                                installLinkFilename = '';
                                            }
                                     }

                                    //if(this.active == '1') {
                                    var greyText = ' class="activerows"';
                                    if(this.active == '0') {
                                           greyText = ' style="color: #ccc;"';
                                    }

                                    var downloadButton = '';
                                    var username = 'exebetche';
                                    downloadButton = '<a href="'+downloadUrl+'" data-username="'+username+'" class="btn btn-native btn-min-width opendownloadfile" ><img src="/images/system/download.svg" alt="download" style="width:20px; height:20px"></a>' ;

                                    if(this.version==null) {version = '';} else{version = this.version;}
                                    var isExternLink = false;
                                    if ((typeof link != 'undefined') && (link != "")) {
                                       isExternLink = true;
                                    }



                                    var mnt = moment(this.created_timestamp);

                                        $pploadCollection.find('table[data-ppload-files] tbody').append(
                                            '<tr data-ppload-file-id="' + this.id + '"' + greyText + '>'
                                            + '<td>' + downloadLink + '</td>'
                                            + '<td>' + version + '</td>'
                                            + '<td>' + fileDescription + '</td>'
                                            + '<td>' + this.type + '</td>'
                                            + '<td>'
                                            + '<select id="data-select-packagetype' + this.id + '" data-packagetype-id="" name="packagetype" class="form-control input-sm" style="width: 200px;">'
                                            + '<option value=\"\"></option>'
                                            + '<option value=\"2\">Android (APK)</option>'
                                            + '<option value=\"1\">AppImage</option>'
                                            + '<option value=\"9\">Arch</option>'
                                            + '<option value=\"5\">Debian</option>'
                                            + '<option value=\"8\">Electron-Webapp</option>'
                                            + '<option value=\"7\">Flatpak</option>'
                                            + '<option value=\"10\">open/Suse</option>'
                                            + '<option value=\"3\">OS X compatible</option>'
                                            + '<option value=\"11\">Redhat</option>'
                                            + '<option value=\"6\">Snappy</option>'
                                            + '<option value=\"12\">Source Code</option>'
                                            + '<option value=\"4\">Windows executable</option>'
                                            + '</select><span id="file-tag-packagetype'+this.id+'">'
                                            + '</td>'
                                            + '<td>'
                                            + '<select id="data-select-license' + this.id + '" data-license-id="" name="license">'
                                            + '<option value=\"1000\"></option><option value=\"16\">AGPL</option><option value=\"3\">Artistic 2.0</option><option value=\"6\">BSD</option><option value=\"17\">CC0 1.0 Universal (Public Domain)</option><option value=\"9\">CPL 1.0</option><option value=\"10\">Creative Commons by</option><option value=\"13\">Creative Commons by-nc</option><option value=\"15\">Creative Commons by-nc-nd</option><option value=\"14\">Creative Commons by-nc-sa</option><option value=\"12\">Creative Commons by-nd</option><option value=\"11\">Creative Commons by-sa</option><option value=\"8\">GFDL</option><option value=\"1\">GPLv2 or later</option><option value=\"18\">GPLv2 only</option><option value=\"19\">GPLv3</option><option value=\"2\">LGPL</option><option value=\"0\">Other</option><option value=\"7\">Proprietary License</option><option value=\"5\">QPL</option><option value=\"4\">X11</option>'
                                            + '</select><span id="file-tag-license'+this.id+'"><span id="file-tag-license-text'+this.id+'">'
                                            + '</td>'
                                            + '<td style="text-align: right"><span id="download_counter_' + this.id + '">' + count_downloads + '</td>'
                                            + '<td>' +mnt.format('YYYY-MM-DD') + '</td>'
                                            + '<td style="text-align: right">' + humanFileSize(this.size,false) + '</td>'
                                            + '<td style="text-align: right; ">' + downloadButton+ '</td>'
                                            + '<td style="text-align: right; ">' + installButton + '</td>'                                            
                                                                                        + '</tr>'
                                        );


                                        var username = 'exebetche';
                                        $('#dropdown_downloads').append(
                                            //'<li style="padding-bottom: 4px;padding-top: 4px;">&nbsp;<span>' + downloadBtnLink + '</span><span class="right">&nbsp;' + humanFileSize(this.size,false) + '&nbsp;</span></li>'
                                            '<li><a data-username="' + username + '" href="' + downloadBtnLink + '" style="white-space: normal; color: #23527c;" class="opendownloadfile" id="data-link-dl' + this.id + '"><span id="download-link-filename' + this.id + '" style="white-space: normal; color: #23527c;">' + downloadLinkFilename + '</span><span class="right">&nbsp;' + humanFileSize(this.size,false) + '&nbsp;</span></a></li>'
                                        );
                                        $('#dropdown_downloads').addClass("active");
                                        $('#dropdown_downloads').removeClass('hide');
                                        $('#project_btn_download').enable();
                                        $('#project_btn_download').removeClass('disabled');
                                        $('#project_btn_download').addClass("active");
                                        $('#project_btn_download').addClass("btn-primary");

                                        if(ocsUrl && this.active && this.ocs_compatible == 1){
                                            $('#dropdown_installs').addClass("active");
                                            $('#dropdown_installs').removeClass('hide');
                                            $('#project_btn_install').enable();
                                            $('#project_btn_install').removeClass('disabled');
                                            $('#project_btn_install').removeClass('hide');
                                            $('#project_btn_install').addClass("active");
                                            $('#project_btn_grp_install').removeClass("hide");

                                            $('#dropdown_installs').append(
                                                '<li><a href="' + installLink + '" style="white-space: normal; color: #23527c;"><span id="install-link-filename' + this.id + '" style="white-space: normal; color: #23527c;">' + installLinkFilename + '</span><span class="right">&nbsp;' + humanFileSize(this.size,false) + '&nbsp;</span></a></li>'

                                            );
                                        }

                                        if ((typeof osId != 'undefined') && (osId != "")) {
                                            $("#data-updatepploadfile" + this.id + " option[value='" + osId + "']").attr('selected', 'selected');
                                            $os = $("#data-updatepploadfile" + this.id + " option[value='" + osId + "']").text();
                                            //alert("Text: " + $os);
                                            $("#data-updatepploadfile" + this.id).hide();
                                            $("#file-tag-os" + this.id).text($os);
                                        }

                                        if ((typeof licenseId != 'undefined') && (licenseId != "")) {
                                            $("#data-select-license" + this.id + " option[value='" + licenseId + "']").attr('selected', 'selected');
                                            $licenseIdText = $("#data-select-license" + this.id + " option[value='" + licenseId + "']").text();
                                            $("#data-select-license" + this.id).hide();
                                            $("#file-tag-license" + this.id).text($licenseIdText);
                                        } else {
                                         $("#data-select-license" + this.id).hide();
                                        }

                                        if ((typeof license != 'undefined') && (license != "")) {
                                            $("#file-tag-license-text" + this.id).text(license);
                                        }

                                        $("#data-select-license" + this.id).hide();

                                        if ((typeof packagetypeId != 'undefined') && (packagetypeId != "")) {
                                            $("#data-select-packagetype" + this.id + " option[value='" + packagetypeId + "']").attr('selected', 'selected');
                                            $packagetypeIdText = $("#data-select-packagetype" + this.id + " option[value='" + packagetypeId + "']").text();
                                            $("#data-select-packagetype" + this.id).hide();
                                            $("#file-tag-packagetype" + this.id).text($packagetypeIdText);
                                        } else {
                                         $("#data-select-packagetype" + this.id).hide();
                                        }

                                        $("#data-select-packagetype" + this.id).hide();

                                        if ((typeof this.ocs_compatible != 'undefined') && (this.ocs_compatible != "") && this.ocs_compatible == 1) {
                                            $("#data-checkbox-compatible-" + this.id).attr('checked', 'checked');
                                        }


                                        if (isExternLink) {
                                            $fileserverLink = $("#data-link" + this.id).attr('href');
                                            $("#data-link" + this.id).attr('href', decodeURIComponent(link));
                                            $("#data-link" + this.id).attr('data-link-org', $fileserverLink);

                                            $("#data-link" + this.id).attr('target','_blank');
                                            $("#data-link" + this.id).html($("#data-link" + this.id).html() + " (External Link)");

                                            $("#data-link" + this.id).click(function (event) {
                                                event.preventDefault();
                                                $fileserverLink = $(this).attr('data-link-org');
                                                window.open($fileserverLink, '_blank');
                                            });


                                            $fileserverLink = $("#data-link-dl" + this.id).attr('href');
                                            $("#data-link-dl" + this.id).attr('href', decodeURIComponent(link));
                                            $("#data-link-dl" + this.id).attr('data-link-org', $fileserverLink);

                                            $("#data-link-dl" + this.id).attr('target','_blank');

                                            $("#download-link-filename" + this.id).html($("#download-link-filename" + this.id).html() + " (External Link)");

                                            $("#data-link-dl" + this.id).click(function (event) {
                                                event.preventDefault();
                                                $fileserverLink = $(this).attr('data-link-org');
                                                window.open($fileserverLink, '_blank');
                                            });

                                            $("#install-link-filename" + this.id).html($("#install-link-filename" + this.id).html() + " (External Link)");
                                        }


                                        $compatibleCheckbox = $("#data-checkbox-compatible-" + this.id);

                                        if(this.active == '0') {
                                            $compatibleCheckbox.prop('disabled', 'disabled');
                                        }

                                        $compatibleCheckbox.click(function (event) {
                                            event.preventDefault();
                                            $fileId = $(this).closest('tr[data-ppload-file-id]').attr('data-ppload-file-id');
                                            $isCompatible = this.checked;
                                            updateOcsCompatible($fileId, $isCompatible);
                                        });


                                        //fileSizeSum += parseInt(this.size);
                                        if(parseInt(this.size)>0) {
                                            fileSizeSum += roundFileSizeInMB(parseInt(this.size));
                                        }

                                    //if (!isExternLink)
                                    //{
                                       //fileSizeSum += roundFileSizeInMB(parseInt(this.size));
                                    //}


                                    if (this.type == 'audio/mpeg' || this.type == 'application/ogg') {
                                        isPlayable = true;
                                    }

                                    //}

                                 });

                                 //
                                 //Inactive Fiels
                                 //
                                 $.each(myArrayInactive, function () {
                                    if(null == oldestFileId) {
                                            oldestFileId = this.id;
                                    }

                                    if(this.id < oldestFileId) {
                                            oldestFileId = this.id;
                                    }

                                    cout_downloads = this.downloaded_count || 0;

                                    downloaded_count_total = downloaded_count_total+parseInt(cout_downloads);

                                    downloadLink = this.name;

                                     var fileDescription = '';
                                     if (this.description) {
                                         fileDescription = this.description;
                                     }

                                     var licenseId = '';
                                     var license = '';
                                     if (this.tags) {
                                         fileTags = this.tags;
                                         $.each(fileTags.split(','), function () {

                                             if(this.indexOf("##")==-1) {
                                              var tagStr = this.split('-');
                                              if (tagStr.length == 2 && tagStr[0] == 'os') {
                                                  osId = tagStr[1];
                                              } else if (tagStr.length == 2 && tagStr[0] == 'licensetype') {
                                                  licenseId = tagStr[1];
                                              } else if (tagStr.length == 2 && tagStr[0] == 'packagetypeid') {
                                                  packagetypeId = tagStr[1];
                                              }
                                             } else {
                                              var tagStr = this.split('##');
                                              if (tagStr.length == 2 && tagStr[0] == 'link') {
                                                  link = tagStr[1];
                                              } else if (tagStr.length == 2 && tagStr[0] == 'license') {
                                                  license = tagStr[1];
                                                  license = Base64.decode(license);
                                              } else if (tagStr.length == 2 && tagStr[0] == 'packagetypeid') {
                                                  packagetypeId = tagStr[1];
                                              }
                                             }
                                             /*else if (tagStr.length == 2 && tagStr[0] == 'package') {
                                              packageId = tagStr[1];
                                              }
                                              else if (tagStr.length == 2 && tagStr[0] == 'arch') {
                                              archId = tagStr[1];
                                              }
                                              else if (tagStr.length == 2 && tagStr[0] == 'device') {
                                              deviceId = tagStr[1];
                                              }*/
                                         });
                                     }

                                     //if(this.active == '1') {
                                       var greyText = ' class="inactiverows" style="color: #ccc; display:none;"';

                                       if(this.version==null) {version = '';} else{version = this.version;}

                                         var isExternLink = false;
                                         if ((typeof link != 'undefined') && (link != "")) {
                                            isExternLink = true;
                                            downloadLink = '<a href="' + decodeURIComponent(link) + '" id="data-link' + this.id + '" style="color: #ccc;">' + this.name + '</a>';
                                         }
                                         var mnt = moment(this.created_timestamp);
                                         $pploadCollection.find('table[data-ppload-files] tbody').append(
                                            '<tr' + greyText + '>'
                                            + '<td>' + downloadLink + '</td>'
                                                + '<td>' + version + '</td>'
                                            + '<td>' + fileDescription + '</td>'
                                            + '<td>' + this.type + '</td>'
                                                + '<td>'
                                                + '<select id="data-select-packagetype' + this.id + '" data-packagetype-id=" name="packagetype" class="form-control input-sm" style="width: 200px;">'
                                                + '<option value=\"\"></option>'
                                                + '<option value=\"2\">Android (APK)</option>'
                                                + '<option value=\"1\">AppImage</option>'
                                                + '<option value=\"9\">Arch</option>'
                                                + '<option value=\"5\">Debian</option>'
                                                + '<option value=\"8\">Electron-Webapp</option>'
                                                + '<option value=\"7\">Flatpak</option>'
                                                + '<option value=\"10\">open/Suse</option>'
                                                + '<option value=\"3\">OS X compatible</option>'
                                                + '<option value=\"11\">Redhat</option>'
                                                + '<option value=\"6\">Snappy</option>'
                                                + '<option value=\"12\">Source Code</option>'
                                                + '<option value=\"4\">Windows executable</option>'
                                                + '</select><span id="file-tag-packagetype'+this.id+'">'
                                                + '</td>'
                                            + '<td>'
                                            + '<select id="data-select-license' + this.id + '" data-license-id=" name="license">'
                                            + '<option value=\"1000\"></option><option value=\"16\">AGPL</option><option value=\"3\">Artistic 2.0</option><option value=\"6\">BSD</option><option value=\"17\">CC0 1.0 Universal (Public Domain)</option><option value=\"9\">CPL 1.0</option><option value=\"10\">Creative Commons by</option><option value=\"13\">Creative Commons by-nc</option><option value=\"15\">Creative Commons by-nc-nd</option><option value=\"14\">Creative Commons by-nc-sa</option><option value=\"12\">Creative Commons by-nd</option><option value=\"11\">Creative Commons by-sa</option><option value=\"8\">GFDL</option><option value=\"1\">GPLv2 or later</option><option value=\"18\">GPLv2 only</option><option value=\"19\">GPLv3</option><option value=\"2\">LGPL</option><option value=\"0\">Other</option><option value=\"7\">Proprietary License</option><option value=\"5\">QPL</option><option value=\"4\">X11</option>'
                                            + '</select><span id="file-tag-license'+this.id+'"><span id="file-tag-license-text'+this.id+'">'
                                            + '</td>'
                                            + '<td style="text-align: right"><span id="download_counter_' + this.id + '">' + cout_downloads + '</td>'
                                            + '<td>' +mnt.format('YYYY-MM-DD')  + '</td>'
                                            + '<td style="text-align: right">' + humanFileSize(this.size,false) + '</td>'
                                                + '<td></td>'
                                                + '<td></td>'
                                            + '</tr>'
                                         );

                                         if ((typeof osId != 'undefined') && (osId != "")) {
                                             $("#data-updatepploadfile" + this.id + " option[value='" + osId + "']").attr('selected', 'selected');
                                             $os = $("#data-updatepploadfile" + this.id + " option[value='" + osId + "']").text();
                                             //alert("Text: " + $os);
                                             $("#data-updatepploadfile" + this.id).hide();
                                             $("#file-tag-os" + this.id).text($os);
                                         }

                                         if ((typeof licenseId != 'undefined') && (licenseId != "")) {
                                             $("#data-select-license" + this.id + " option[value='" + licenseId + "']").attr('selected', 'selected');
                                             $licenseIdText = $("#data-select-license" + this.id + " option[value='" + licenseId + "']").text();
                                             $("#data-select-license" + this.id).hide();
                                             $("#file-tag-license" + this.id).text($licenseIdText);
                                         } else {
                                          $("#data-select-license" + this.id).hide();
                                         }

                                         $("#data-select-license" + this.id).hide();

                                         if ((typeof license != 'undefined') && (license != "")) {
                                             $("#file-tag-license-text" + this.id).text(license);
                                         }

                                             if ((typeof packagetypeId != 'undefined') && (packagetypeId != "")) {
                                             $("#data-select-packagetype" + this.id + " option[value='" + packagetypeId + "']").attr('selected', 'selected');
                                             $packagetypeIdText = $("#data-select-packagetype" + this.id + " option[value='" + packagetypeId + "']").text();
                                             $("#data-select-packagetype" + this.id).hide();
                                             $("#file-tag-packagetype" + this.id).text($packagetypeIdText);
                                         } else {
                                          $("#data-select-packagetype" + this.id).hide();
                                         }

                                         $("#data-select-packagetype" + this.id).hide();



                                         if (isExternLink) {
                                            //$("#data-link" + this.id).attr('href', decodeURIComponent(link));
                                                $("#data-link" + this.id).attr('target','_blank');
                                            $("#data-link" + this.id).html($("#data-link" + this.id).html() + " (External Link)");
                                         }



                                        //fileSizeSum += parseInt(this.size);
                                            if(parseInt(this.size)>0) {
                                                fileSizeSum += roundFileSizeInMB(parseInt(this.size));
                                            }
                                         //if (!isExternLink)
                                         //{
                                            //fileSizeSum += roundFileSizeInMB(parseInt(this.size));
                                         //}


                                         if (this.type == 'audio/mpeg' || this.type == 'application/ogg') {
                                             isPlayable = true;
                                         }

                                     //}

                                 });


                                 //add old download counter
                                 downloaded_count_total += parseInt(313645);

                                 //add old download counter to oldest file
                                 var fileCount = $('#download_counter_'+ oldestFileId).html();
                                 var oldNewCounter = parseInt(fileCount) + parseInt(313645);
                                 $('#download_counter_'+ oldestFileId).html(oldNewCounter);



                                //$('#downloadscnt').html(downloaded_count_total);

                                 $pploadCollection.find('table[data-ppload-files] tfoot').append(
                                     '<tr>'
                                     + '<th colspan="6">' + myArrayActive.length + ' files (<span style="color: #ccc;" ><a style="cursor:pointer" onclick="fnToggleInactiveFiles();return false;">'+myArrayInactive.length+' archived</a></span>)</th>'
                                     + '<th style="text-align: right">' + downloaded_count_total + '</th>'
                                     + '<th></th>'
                                    + '<th style="text-align: right">' + fileSizeSum.toFixed(2) + ' MB</th>'
                                     //+ '<th style="text-align: right">' + humanFileSize(fileSizeSum) + '</th>'
                                     + '<th></th>'
                                       + '<th></th>'
                                     + '</tr>'
                                 );

                                 $pploadCollection.find('a[data-ppload-download-link]').attr(
                                     'href',
                                     pploadApiUri + 'collections/download/id/' + collectionId
                                 );

                                 
                                 /*
                                 var b= false;
                                 if (isPlayable && !$plingMusic.attr('src')) {
                                     $plingMusic.attr({
                                         src: $plingMusic.attr('data-pling-music-uri')
                                         + '?play_collection=' + collectionId,
                                         width: '100%',
                                         height: '550'
                                     });

                                 $('.carousel-inner').prepend($('#carouselPPlay').show());
                                 $('.carousel-indicators').prepend('<li data-target="#myCarousel" data-slide-to="0"></li>');
                                 $('.carousel-indicators > li').first().addClass('active');
                                    b = true;
                                 }
                                 
                                 if(!b){
                                   activeCarouselFirstImg();
                                 }
                                  */


                                 if (data.pagination.next) {
                                     getPploadFiles(data.pagination.next);
                                 }

                             },
                             error: function (jqXHR, textStatus, errorThrown) {

                                  activeCarouselFirstImg();


                             }
                         });
                     }

                     function generateOcsUrl(url, type, filename) {
                         if (!url || !type) {
                             return '';
                         }
                         if (!filename) {
                             filename = url.split('/').pop().split('?').shift();
                         }
                         return 'ocs://install'
                            + '?url=' + encodeURIComponent(url)
                            + '&type=' + encodeURIComponent(type)
                            + '&filename=' + encodeURIComponent(filename);
                     }


                     function updateOcsCompatible(fileId, isCompatible) {
                        var $url = "/p/1154080/updatepploadfile";

                        if(fileId != 'undefined' && fileId != null) {

                            $.ajax({
                                url: $url,
                                type: 'POST',
                                data: {
                                    file_id: fileId,
                                    ocs_compatible: (isCompatible==true?1:0)
                                },
                                dataType: 'json',
                                success: function (data, textStatus, jqXHR) {
                                    if (data.status == 'ok') {
                                        $("#files-panel").find('table[data-ppload-files] tbody').html('');
                                        $('#dropdown_downloads').html('');
                                        $("#files-panel").find('table[data-ppload-files] tfoot').html('');
                                        getPploadFiles();

                                    }

                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    alert("Error: " + textStatus + ", " + errorThrown);

                                }
                            });
                        }
                    }

                    function shortFilename(filename) {
                        var returnString = filename;
                        if(filename.length > 25) {
                            var name = filename.substring(0,22);
                            var fileExt = filename.split('.').pop();
                            if(fileExt.length>3) {
                                name = name.substring(0,(25-fileExt.length));
                            }
                            returnString = name + '...' + fileExt;
                        }
                        return returnString;
                    }


                     function roundFileSizeInMB(bytes)
                     {
                        // min size 0.01MB
                        if(bytes>0)
                        {
                            var size = (bytes / 1048576).toFixed(2);
                            if(size == '0.00')
                            {
                                return Number('0.01');
                            }else
                            {
                                return Number(size);
                            }
                        }
                     }



                      fnToggleInactiveFiles = function(){
                           $('.inactiverows').toggle();
                      };



                     function humanFileSize(bytes,isExternLink) {
                         if(isExternLink) return '----';
                         if(bytes>0)
                         {
                             var size = '';
                             size = (bytes / 1048576).toFixed(2);
                             if(size == '0.00')
                             {
                                return '0.01 MB';
                             }else
                             {
                                return size+' MB';
                             }
                         }
                         else
                         {
                            return '0.00 MB';
                         }
                     }

                     function humanFileSize_(bytes) {
                         if(bytes>0)
                         {
                             var size = '';
                             size = (bytes / 1048576).toFixed(2);
                             /*
                              if (bytes >= 1073741824) {
                              size = (bytes / 1073741824).toFixed(2) + 'GB';
                              }
                              else if (bytes >= 1048576) {
                              size = (bytes / 1048576).toFixed(2) + 'MB';
                              }
                              else if (bytes >= 1024) {
                              size = (bytes / 1024).toFixed(2) + 'KB';
                              }
                              else {
                              size = bytes + 'bytes';
                              }*/

                             if(size == '0.00')
                             {
                                return '0.01 MB';
                             }else
                             {
                                return size+' MB';
                             }
                         }
                         else
                         {
                            return '0.00 MB';
                         }
                     }

                     //$('a[href="#files-panel"][data-toggle="tab"]').on('click', function () {
                     if (!hasFilesPanelOpened) {
                         getPploadFiles();
                         hasFilesPanelOpened = true;


                     }
                     //});

                 });

                $(function() {
                    $('#modal-installation-instructions').on('hidden.bs.modal', function (e) {
                              var iframe = document.getElementById('iframeInstallInstruction');
                              var leg=$(iframe).attr("src");
                              $(iframe).attr("src","");
                        });

                    $('#modal-installation-instructions').on('show.bs.modal', function (e) {
                              var iframe = document.getElementById('iframeInstallInstruction');
                              var leg=$(iframe).attr("src");
                              $(iframe).attr("src","https://opendesktop.github.io/ocs-url/opendesktoporg-help.html");
                        });

                });
             </script>
                  <!-- /ppload -->
                            </div>
                        </div>


                    </div>

                    <!-- /PANELS -->


                </div>


            </div>
            <div class="flex-item-4 flex-right" id="product-maker">
                <div>
                    <div class="project-share-new col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <script type="text/javascript">
                            function fbs_click(a) {
                                u = location.href;
                                t = document.title;
                                window.open(a.getAttribute('href') + '&t=' + encodeURIComponent(t), 'sharer', 'toolbar=0,status=0,width=626,height=436');
                                return false;
                            }

                        </script>


                        <div class="row">
                            <a class="share-button facebook"
                               href="http://www.facebook.com/sharer.php?u=&title= Youtube playlist"
                               target="_blank" onclick=" return fbs_click(this);">
                                <span class="share-verb">Share</span>
                            </a>

                            <a class="share-button twitter"
                               href="http://twitter.com/share?text=I like this  Youtube playlist&amp;url=&amp;related=plingit"
                               target="_blank"
                               onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=436,width=626');return false;">
                                <span class="share-verb">Tweet</span>
                            </a>

                            <span style="margin-left: 5px;padding-top: 5px">
                              <a class="g-plus" data-action="share" data-annotation="bubble" data-width="120"
                                 data-height="24"></a>
                              </span>
                        </div>

                        <script>
                            window.___gcfg = {
                                lang: 'en-US',
                                parsetags: 'onload'
                            };
                        </script>
                        <script src="https://apis.google.com/js/platform.js" async defer></script>

                                                    <div class="prod-widget-box prod-user right ">
                                <div class="sidebar-content">
                                    <div class="product-maker-sidebar">
                                        <div class="product-maker-thumbnail relative">
                                            <a href="http://opendesktop.org/member/223978/"
                                               title="exebetche"  class="tooltipuserleft" data-tooltip-content="#tooltip_content" data-user="223978">
                                                                                              
                                                <img src="https://cn.pling.com/cache/80x80/img/hive/user-bigpics/0/exebetche.jpg"
                                                     alt="product-maker" width="15" height="15"
                                                     class="sidebar-profile-image">
                                            </a>
                                        </div>
                                        <div class="product-maker-summary">
                                            <h5>
                                                <a href="http://opendesktop.org/member/223978/" class="tooltipuserleft" data-tooltip-content="#tooltip_content" data-user="223978">
                                                    exebetche                                                </a>
                                            </h5>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                                                
                        <div>
                            <div class="prod-widget-box right">
                                <div  class="btn-group dropleft" style="width: 100%">
                                    <button style="width: 100%" id="project_btn_download" class="btn dropdown-toggle disabled" type="button" data-toggle="dropdown">Download
                                    <span class="caret"></span></button>
                                    <ul class="dropdown-menu hide" id="dropdown_downloads" style="min-width: 270px;">
                                    </ul>
                                </div> 
                                
                                <div id="project_btn_grp_install" class="btn-group dropleft hide" style="width: 100%; padding-top: 10px;">
                                    <button style="width: 100%" id="project_btn_install" class="btn btn-primary dropdown-toggle disabled hide" type="button" data-toggle="dropdown">Install
                                    <span class="caret"></span></button>
                                    <ul class="dropdown-menu hide" id="dropdown_installs" style="min-width: 270px;">
                                    </ul>
                                </div> 
                            </div>
                        </div>


                        <!-- MORE PRODUCTS -->

                        <div>
                                                    </div>

                        <div>
                            <div class="prod-widget-box right moreproducts">

    <div class="sidebar-content">
        <span>Other VLC Playlist Parsers: </span>
        <div class="sidebar-content-section">
            <div class="row product-row" style="margin-top: -20px">
                                    <!-- product item -->
                    <div class="col-md-3 col-lg-3 col-sm-4 col-xs-3 product-thumbnail"
                         data-toggle="popover"
                         data-trigger="hover"
                         data-html="true"
                         data-placement="top"
                         data-content="<div class='profile-img-product'>
			                     <img class='imgpopover'  src='https://cn.pling.com/cache/200x160/img/default.png'/>
			                     </div>
                                <div class='content'>
                                    <div class='title'>
                                        <p>VLC Custom TV Channe - VLC Playlist Parsers</p>
                                      
                                    </div>  			                                                  
                                </div>">
                        <!-- product thumbnail -->
                        <a
                            href="/p/1154052/"
                            title="VLC Custom TV Channel Maker">
                            <img src="https://cn.pling.com/cache/80x80/img/default.png"
                                 alt="product">
                        </a>
                        <!-- /product thumbnail -->
                    </div>
                    <!-- /product item -->
                                    <!-- product item -->
                    <div class="col-md-3 col-lg-3 col-sm-4 col-xs-3 product-thumbnail"
                         data-toggle="popover"
                         data-trigger="hover"
                         data-html="true"
                         data-placement="top"
                         data-content="<div class='profile-img-product'>
			                     <img class='imgpopover'  src='https://cn.pling.com/cache/200x160/img/default.png'/>
			                     </div>
                                <div class='content'>
                                    <div class='title'>
                                        <p>Youporn parser - VLC Playlist Parsers</p>
                                      
                                    </div>  			                                                  
                                </div>">
                        <!-- product thumbnail -->
                        <a
                            href="/p/1154079/"
                            title="Youporn parser">
                            <img src="https://cn.pling.com/cache/80x80/img/default.png"
                                 alt="product">
                        </a>
                        <!-- /product thumbnail -->
                    </div>
                    <!-- /product item -->
                                    <!-- product item -->
                    <div class="col-md-3 col-lg-3 col-sm-4 col-xs-3 product-thumbnail"
                         data-toggle="popover"
                         data-trigger="hover"
                         data-html="true"
                         data-placement="top"
                         data-content="<div class='profile-img-product'>
			                     <img class='imgpopover'  src='https://cn.pling.com/cache/200x160/img//hive/content-pre1/146014-1.png'/>
			                     </div>
                                <div class='content'>
                                    <div class='title'>
                                        <p>TVN 24 Fakty - VLC Playlist Parsers</p>
                                      
                                    </div>  			                                                  
                                </div>">
                        <!-- product thumbnail -->
                        <a
                            href="/p/1154074/"
                            title="TVN 24 Fakty">
                            <img src="https://cn.pling.com/cache/80x80/img//hive/content-pre1/146014-1.png"
                                 alt="product">
                        </a>
                        <!-- /product thumbnail -->
                    </div>
                    <!-- /product item -->
                                    <!-- product item -->
                    <div class="col-md-3 col-lg-3 col-sm-4 col-xs-3 product-thumbnail"
                         data-toggle="popover"
                         data-trigger="hover"
                         data-html="true"
                         data-placement="top"
                         data-content="<div class='profile-img-product'>
			                     <img class='imgpopover'  src='https://cn.pling.com/cache/200x160/img/default.png'/>
			                     </div>
                                <div class='content'>
                                    <div class='title'>
                                        <p>Pornhub parser - VLC Playlist Parsers</p>
                                      
                                    </div>  			                                                  
                                </div>">
                        <!-- product thumbnail -->
                        <a
                            href="/p/1154076/"
                            title="Pornhub parser">
                            <img src="https://cn.pling.com/cache/80x80/img/default.png"
                                 alt="product">
                        </a>
                        <!-- /product thumbnail -->
                    </div>
                    <!-- /product item -->
                                    <!-- product item -->
                    <div class="col-md-3 col-lg-3 col-sm-4 col-xs-3 product-thumbnail"
                         data-toggle="popover"
                         data-trigger="hover"
                         data-html="true"
                         data-placement="top"
                         data-content="<div class='profile-img-product'>
			                     <img class='imgpopover'  src='https://cn.pling.com/cache/200x160/img/default.png'/>
			                     </div>
                                <div class='content'>
                                    <div class='title'>
                                        <p>Youtube playlist - VLC Playlist Parsers</p>
                                      
                                    </div>  			                                                  
                                </div>">
                        <!-- product thumbnail -->
                        <a
                            href="/p/1154073/"
                            title="Youtube playlist">
                            <img src="https://cn.pling.com/cache/80x80/img/default.png"
                                 alt="product">
                        </a>
                        <!-- /product thumbnail -->
                    </div>
                    <!-- /product item -->
                                    <!-- product item -->
                    <div class="col-md-3 col-lg-3 col-sm-4 col-xs-3 product-thumbnail"
                         data-toggle="popover"
                         data-trigger="hover"
                         data-html="true"
                         data-placement="top"
                         data-content="<div class='profile-img-product'>
			                     <img class='imgpopover'  src='https://cn.pling.com/cache/200x160/img/default.png'/>
			                     </div>
                                <div class='content'>
                                    <div class='title'>
                                        <p>Megavideo 0.05 - VLC Playlist Parsers</p>
                                      
                                    </div>  			                                                  
                                </div>">
                        <!-- product thumbnail -->
                        <a
                            href="/p/1154051/"
                            title="Megavideo 0.05">
                            <img src="https://cn.pling.com/cache/80x80/img/default.png"
                                 alt="product">
                        </a>
                        <!-- /product thumbnail -->
                    </div>
                    <!-- /product item -->
                                    <!-- product item -->
                    <div class="col-md-3 col-lg-3 col-sm-4 col-xs-3 product-thumbnail"
                         data-toggle="popover"
                         data-trigger="hover"
                         data-html="true"
                         data-placement="top"
                         data-content="<div class='profile-img-product'>
			                     <img class='imgpopover'  src='https://cn.pling.com/cache/200x160/img/default.png'/>
			                     </div>
                                <div class='content'>
                                    <div class='title'>
                                        <p>IIS Smooth Streaming - VLC Playlist Parsers</p>
                                      
                                    </div>  			                                                  
                                </div>">
                        <!-- product thumbnail -->
                        <a
                            href="/p/1154072/"
                            title="IIS Smooth Streaming parser 0.03">
                            <img src="https://cn.pling.com/cache/80x80/img/default.png"
                                 alt="product">
                        </a>
                        <!-- /product thumbnail -->
                    </div>
                    <!-- /product item -->
                                    <!-- product item -->
                    <div class="col-md-3 col-lg-3 col-sm-4 col-xs-3 product-thumbnail"
                         data-toggle="popover"
                         data-trigger="hover"
                         data-html="true"
                         data-placement="top"
                         data-content="<div class='profile-img-product'>
			                     <img class='imgpopover'  src='https://cn.pling.com/cache/200x160/img/default.png'/>
			                     </div>
                                <div class='content'>
                                    <div class='title'>
                                        <p>Rai parser 0.05 - VLC Playlist Parsers</p>
                                      
                                    </div>  			                                                  
                                </div>">
                        <!-- product thumbnail -->
                        <a
                            href="/p/1154050/"
                            title="Rai parser 0.05">
                            <img src="https://cn.pling.com/cache/80x80/img/default.png"
                                 alt="product">
                        </a>
                        <!-- /product thumbnail -->
                    </div>
                    <!-- /product item -->
                            </div>
        </div>
    </div>

</div>
<script type="application/javascript">
    // tool tips
    $('body').on('mouseenter', '.product-thumbnail, .supporter-thumbnail', function () {
        $(this).popover('show');
    });

    $('body').on('mouseleave', '.product-thumbnail, .supporter-thumbnail', function () {
        $(this).popover('hide');
    });
</script>                        </div>
                        <!-- /MORE PRODUCTS -->


                        
                        <div class="prod-widget-box right details">
    <span class="title"> Details </span>

    <div class="row">
        <span class="col-lg-6">license</span>
        <div class="col-lg-6">
            <span class="value">
             </span>
        </div>
    </div>

    <div class="row">
        <span class="col-lg-6">version</span>
        <div class="col-lg-6">
            <span class="value">
             </span>
        </div>
    </div>

            <div class="row">
            <span class="col-lg-6">updated</span>
            <span class="col-lg-6 value"> Sep 05 2017</span>
        </div>
    
    <div class="row">
        <span class="col-lg-6">added</span>
        <span class="col-lg-6 value"> Apr 04 2012</span>
    </div>
    <div class="row">
        <span class=" col-lg-6">downloads today</span>
        <span class="col-lg-6 value"> <div id="downloadscnt">0</div></span>
    </div>

    <div class="row">
        <span class=" col-lg-6">page views today </span>
        <span class="col-lg-6 value"> 167</span>
    </div>
    
    
        <div class="row" style="padding-top: 5px">
        <div class="col-lg-12">
            <div class="small " id="product-actions">
                <a data-toggle="modal" data-target="#report-product-1154080" role="button"
                   href="#report-product-1154080">
                    <span class="glyphicon glyphicon-alert"></span> Report SPAM
                </a>
            </div>
        </div>
    </div>


  
            

    <script>
        (function (collection_id) {
            if (!collection_id) {
                return;
            }
            var current_date = new Date().toISOString().split('T')[0];
            $.ajax({
                url: 'https://dl.opendesktop.org/api/files/index',
                type: 'GET',
                data: {
                    format: 'json',
                    status: 'active',
                    collection_id: collection_id,
                    downloaded_timeperiod_begin: current_date,
                    perpage: 1000
                },
                dataType: 'json',
                success: function (response_data, textStatus, jqXHR) {
                    var amount = 0;
                    if (response_data.status === 'success') {
                        var files = response_data.files;
                        $.each(files, function(index, data_file) {
                            amount += parseInt(data_file.downloaded_timeperiod_count);
                        });
                        $('#downloadscnt').empty().append(amount);
                    }
                }
            });
        }(1473753829));
    </script>
</div>
                      



                    </div>
                </div>

            </div>

        </div>

         <div class="tooltip_templates" style="display: none">
            <span id="tooltip_content">
                <i class="fa fa-spinner"></i>
            </span>
        </div>
    </main>

                    

    <script>(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>

<script>
    (function (collection_id) {
        if (!collection_id) {
            return;
        }
        $.ajax({
            url: 'https://dl.opendesktop.org/api/files/index',
            type: 'GET',
            data: {
                format: 'json',
                status: 'active',
                collection_id: collection_id,
                perpage: 1000
            },
            dataType: 'json',
            success: function (response_data, textStatus, jqXHR) {
                var amount;
                if (response_data.status === 'success') {
                    amount = response_data.pagination.totalItems;
                    if (0 < parseInt(amount)) {
                        $('#files-counter').append('('+amount+')');
                    }
                }
            }
        });
    }(1473753829));
</script>



<footer>
    <section class="wrapper">
        <section>
            <div class="pull-left col-lg-10 col-md-10 col-sm-9 col-xs-9">
                <h3 id="footer-heading" class="lightblue">Free and OpenSource Software and Content - opendesktop.org</h3>
                <nav id="footer-nav">
                    
                    <ul class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <!-- <li><a href="/faq">What is opendesktop.org?</a></li> -->
                        <!-- <li><a href="http://www.ocsmag.com/" target="blank">Blog</a></li>  -->
                        <li><a href="/terms">Terms & Conditions</a></li>
                        <li><a href="/privacy">Privacy Policy</a></li>
                        <li><a href="/contact">Contact</a></li>                        
                        <li><span style="color:#666;">&#169; 2018 opendesktop.org - Free and OpenSource Software and Content</span></li>
                                             
                        <li style="display: block; margin-left:0px; padding-top:5px;color:#666;">All rights reserved. All trademarks are copyright by their respective owners. All contributors are responsible for their uploads.
                         </li>
                    </ul>
                   
                </nav>
            </div>
            
            

            <div class="pull-right col-lg-2 col-md-2 col-sm-3 col-xs-3" style="height:66px; ">
                <div style="position:absolute; bottom:3px;color:#666">
                Powered by opendesktop.org
                </div>
                <div class="pull-right" style="position: absolute; bottom: 0; right:0;">
                    <h3 id="footer-social-heading">Follow us on</h3>

                    <div id="footer-social">
                        <a href="https://www.facebook.com/opendesktop.org"
                           id="facebook"
                           target="_blank"><img src="/theme/flatui/img/new/f_icon_fb.png"/></a>
                        <a href="https://twitter.com/opendesktop"
                           id="twitter"
                           target="_blank"><img src="/theme/flatui/img/new/f_icon_tw.png"/></a>
                        <a href="https://plus.google.com/115086171173715906631"
                           rel="publisher"
                           id="g-plus"
                           target="_blank"><img src="/theme/flatui/img/new/f_icon_gp.png"/></a>
                    </div>
                </div>
            </div>
        </section>
    </section>
    
    
    
</footer>


<div id="overlays" class="" tabindex="-1" role="dialog"></div>
<div id="modal-dialog" class="modal hide fade" tabindex="-1" role="dialog">
    <div class="modal-body"></div>
    <div id="error"></div>
</div>

<div id="generic-dialog" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header row">
                <div class="modal-header-text col-md-11">Put the headline here</div>
                <button type="button" class="close col-md-1" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer hidden">
                <button type="button" class="btn btn-native" data-dismiss="modal" style="padding: 5px 10px;">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="delete-confirmation">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <p id="delete-confirmation-msg"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="delete-confirmation-no" data-dismiss="modal" >Cancel</button>
                <button type="button" class="btn red-pink" id="delete-confirmation-yes">Yes</button>
            </div>
        </div>
    </div>
</div>
<script type="application/javascript">
        function defaultCallbackConfirmation(link) {
        // Do however you want to handle deleting
        // We have the link element and can access it's data attributes
        $(link).closest('form').submit();
    }

    $(document).ready(function() {
        // Now, when the button is clicked, setup the message, attach event with button
        // and then show the modal
        $(document).on('click', '.remove, .confirm', function(e) {
            e.preventDefault();
            var link = this;
            $('#delete-confirmation-msg').html($(this).data('message'));
            $('#delete-confirmation-yes').on('click', function() {
                var callback = $(link).data('callback');
//                if(typeof callback == 'function') {
                    window[callback](link);
//                } else {
//                    window.location = $(link).data('url');
//                }

                $('#delete-confirmation').modal('hide');
            });

            if(yesBtn = $(this).data('yes-btn')) {
                $('#delete-confirmation-yes').html(yesBtn);
            }
            if(noBtn = $(this).data('no-btn')) {
                $('#delete-confirmation-no').html(noBtn);
            }

            $('#delete-confirmation').modal('show');
        });
        $('#delete-confirmation').on('hidden.bs.modal', function (e) {
            $('#delete-confirmation-yes').off();

            $('#delete-confirmation-msg').empty();
            $('#delete-confirmation-yes').text('Yes');
            $('#delete-confirmation-no').text('Cancel');
        });
    });
</script>

<!-- Load JS here for greater good =============================-->
<script src="/theme/flatui/js/lib/jquery.colorbox-min.js"></script>
<script src="/theme/flatui/js/lib/jquery.placeholder.min.js"></script>
<script src="/theme/flatui/js/lib/jquery.jscrollpane.min.js"></script>
<script src="/theme/flatui/js/lib/jquery.zclip.min.js"></script>
<script src="/theme/flatui/js/lib/jquery.mousewheel.min.js"></script>
<script src="/theme/flatui/js/lib/jquery.crypt.js"></script>
<script src="/theme/flatui/js/lib/bootstrap-dialog.min.js"></script>

<script src="/theme/flatui/js/lib/jquery.form.min.js"></script>
<script src="/theme/flatui/js/lib/jquery.validate.min.js"></script>
<script src="/theme/flatui/js/lib/additional-methods.min.js"></script>
<script src="/tools/md5.js"></script>
<script src="/theme/flatui/js/lib/jquery.steps.min.js"></script>
<script src="/theme/flatui/js/lib/jquery-ui.min.js"></script>
<script src="/theme/flatui/js/lib/moment.min.js"></script>
<script type="text/javascript" src="/tools/fancybox2.1.4/jquery.fancybox.pack.js?v=2.1.4"></script>
<script src="/theme/flatui/js/script.js?v1.4"></script>


<script type="text/javascript">
    //<![CDATA[
        $(document).ready(function(){            
            PartialsReview.setup();
        });
        //]]>
</script>
<script type="text/javascript">
    //<![CDATA[
        $(document).ready(function(){            
            AjaxForm.setup("form#product-add-comment1", "div#product-discussion");
            AjaxForm.setup("form#product-add-comment2", "div#product-discussion");
            ProductDetailCommentTooltip.setup();
        });
        //]]>
</script>
<script type="text/javascript">
    //<![CDATA[
        $(document).ready(function(){            
            productRatingToggle.setup();
        });
        //]]>
</script>
<script type="text/javascript">
    //<![CDATA[
        $(document).ready(function(){       
            PartialJson.setup();
            ProductDetailCarousel.setup();          
            PartialCommentReviewForm.setup();
            PartialsButtonHeartDetail.setup();           
            TooltipUser.setup("tooltipuserleft","left");                  
        });
        //]]>
</script>
<script type="text/javascript">
    //<![CDATA[
        $(document).ready(function(){
                MenuHover.setup();
                AboutContent.setup();      
                PlinglistContent.setup();        
                LoginContainer.update();
                PlingsRedirect.setup();
            });
            //]]>
</script>
        <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-78422931-1', 'auto', {'allowLinker': true});
        ga('require', 'linker');
        ga('linker:autoLink', ['www.opendesktop.org'] );
        ga('send', 'pageview');

    </script>
    
    
    <!-- Piwik -->
        <script type="text/javascript">
      var _paq = _paq || [];
      /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
      _paq.push(['trackPageView']);
      _paq.push(['enableLinkTracking']);
      (function() {
        var u="//piwik.pling.com/";
        _paq.push(['setTrackerUrl', u+'piwik.php']);
        _paq.push(['setSiteId', '1']);
        var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
        g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
      })();
    </script>
    <!-- End Piwik Code -->
<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"bam.nr-data.net","licenseKey":"d63ce06dda","applicationID":"86601566","transactionName":"NgQHYUBVDUsEUBIPVg9OJFZGXQxWSlcDAFgUDREaQkYMXBBQEklKCQ4S","queueTime":0,"applicationTime":1120,"atts":"GkMEFwhPHkU=","errorBeacon":"bam.nr-data.net","agent":""}</script></body>
</html>