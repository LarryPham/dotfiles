/*!
 * Ghostery for Chrome
 * http://www.ghostery.com/
 *
 * Copyright 2012 EVIDON, Inc. All rights reserved.
 * See ghostery_eula.txt for license.
 */(function(){function o(e){return i.createElement(e)}function u(){return o("br")}function a(e){for(var t=1;t<arguments.length;t++)e.appendChild(arguments[t])}function f(){var t=o("style"),n=" !important;";t.innerHTML="#"+e+"{"+"border:solid 2px #fff"+n+"box-sizing:content-box"+n+"color:#fff"+n+"display:block"+n+"font:13px Arial,Helvetica"+n+"height:auto"+n+"margin:0"+n+"opacity:0.9"+n+"padding:7px 10px"+n+"position:fixed"+n+"text-align:left"+n+"text-shadow:none"+n+"text-transform:none"+n+"visibility:visible"+n+"width:auto"+n+"z-index:2147483647"+n+"-webkit-border-radius:5px"+n+"-webkit-box-shadow:0px 0px 20px #000"+n+"-webkit-box-sizing:content-box"+n+"}"+"."+e+"-blocked{"+"color:#777"+n+"display:inline"+n+"text-decoration:line-through"+n+"}"+"#"+e+" br{display:block"+n+"}"+"#"+e+" span{background:transparent"+n+"}"+"@media print{#"+e+"{display:none"+n+"}}",a(i.getElementsByTagName("head")[0],t)}function l(){var n=i.getElementById(e);n&&n.parentNode.removeChild(n),clearTimeout(t)}function c(e,t){var n=o("a");return n.style.color="#fff",n.style.textDecoration="underline",n.style.border="none",n.href=e||"#",e&&(n.target="_blank"),a(n,i.createTextNode(t)),n}function h(e,t){var n=o("span");return t&&(n.className=t),a(n,i.createTextNode(e)),n}function p(t,n){var r=o("div");return r.id=e,r.style.setProperty(n&&n.pos_x=="left"?"left":"right","20px","important"),r.style.setProperty(n&&n.pos_y=="bottom"?"bottom":"top","15px","important"),r.style.setProperty("background",t=="showBugs"?"#330033":"#777","important"),i.getElementsByTagName("body")[0]?a(i.body,r):a(i.getElementsByTagName("html")[0],r),t=="showBugs"&&(r.style.cursor="pointer",r.addEventListener("click",function(e){l(),e.preventDefault()})),r}function d(n,r,f){n!="showBugs"&&l();var d,v=o("div"),m=chrome.i18n,g;if(n=="showBugs")for(var y=0;y<r.length;y++)a(v,h(r[y].name,r[y].blocked?e+"-blocked":""),u());else{n!="showUpdateAlert"&&a(v,c("http://purplebox.ghostery.com/?cat=82",m.getMessage("notification_upgrade")));if(n=="showWalkthroughAlert"||n=="showUpdateAlert")n=="showUpdateAlert"?(a(v,h(m.getMessage("notification_update"))),g=c("",m.getMessage("notification_update_link"))):(a(v,u(),u(),h(m.getMessage("notification_reminder1")),u(),h(m.getMessage("notification_reminder2"))),g=c("",m.getMessage("notification_reminder_link"))),g.addEventListener("click",function(e){s.sendRequest({msg:n=="showUpdateAlert"?"showNewTrackers":"openWalkthrough"}),e.preventDefault()}),a(v,u(),u(),g);g=c(!1,m.getMessage("dismiss")),g.addEventListener("click",function(e){l(),e.preventDefault()}),a(v,u(),u(),g)}d=i.getElementById(e),d||(d=p(n,f)),d.innerHTML="",a(d,v),clearTimeout(t),f&&f.timeout&&(t=setTimeout(l,f.timeout*1e3))}var e="ghostery-alert-"+Math.ceil(Math.random()*1e4),t,n=!1,r=!1,i=document,s=chrome.extension;s.onRequest.addListener(function(e,t,u){if(t.tab&&t.tab.url!=s.getURL("background.html"))return;var l=["show","showUpgradeAlert","showWalkthroughAlert","showUpdateAlert"];if(l.indexOf(e.msg)!=-1)n||(n=!0,f()),e.msg=="show"?r||d("showBugs",e.bugs,e.alert_cfg):(d(e.msg),r=!0);else if(e.msg=="surrogate"){var c=o("script");a(c,i.createTextNode(e.surrogate)),i.documentElement.insertBefore(c,i.documentElement.firstChild)}u({})}),s.sendRequest({msg:"pageInjected"})})();