"use strict";(("undefined"!=typeof self?self:global).webpackChunkopen=("undefined"!=typeof self?self:global).webpackChunkopen||[]).push([[379],{65673:(e,t,l)=>{l.r(t),l.d(t,{default:()=>Y});var r=l(59713),n=l.n(r),a=l(73012),i=l(52482),c=l(67294),o=l.n(c);const s="aThi9xmWJ77q5KpCuqKx",u="bMVJiPsu3PHkFyhhiwp5";var m=l(20657),d=l(55911),g=l(30947),f=l(90464),E=l(59482),p=l(72907),y=l(53424),b=l(55120),x=l(1663),h=l(28248),k=l(42922),C=l(49961),P=l(83384),v=l(27481),D=l(82760),R=l(84788),S=l(87257),O=l(37763),I=l.n(O),w=l(78920),T=l(22423),j=l(26921),A=l(18261);const U=o().memo((({uri:e,uid:t,name:l,duration_ms:r,artists:n,album:a,isMOGEFRestricted:i,isExplicit:s,isPlayable:u,index:d,contextUri:g,imgUrl:f,usePlayContextItem:E})=>{const{filter:p}=(0,c.useContext)(T.fo),{isActive:y,isPlaying:b,triggerPlay:x,togglePlay:h}=E({uid:t,uri:e,index:d}),C=(0,w.P)(),{badges:O,hasBadges:U}=(0,R.r)({isExplicit:s}),N=(null==n?void 0:n.map((e=>e.name)).join(m.ag.getSeparator()))||"";return o().createElement(k.ZP,{value:"row",index:d},o().createElement(A._,{menu:o().createElement(j.N,{uri:e,uid:t,contextUri:g})},o().createElement(D.c,{uri:e,contextUri:g,isActive:y,index:d,onTriggerPlay:()=>{x()},ariaRowIndex:d+1,isPlayable:u,ageRestricted:i,dragMetadata:{name:l,createdBy:N}},o().createElement(v.Dd,{ariaColIndex:0},o().createElement(v.Du,{playAriaLabel:m.ag.get("tracklist.a11y.play",l,N),isPlaying:b,onClick:()=>{h()}},o().createElement(v.km,null,d+1))),o().createElement(v.vZ,{ariaColIndex:1},o().createElement(v.lD,{src:f}),o().createElement(v.vm,null,o().createElement(v.Wh,null,o().createElement(I(),{searchWords:[p],textToHighlight:l,findChunks:C,highlightClassName:P.Z.filterHighlight})),U&&o().createElement(v.g3,null,O.explicit?o().createElement(S.N,null):null),o().createElement(v.K9,null,n&&o().createElement(w.o,{nonInteractive:!0,artists:n,filter:p})))),o().createElement(v.UA,{ariaColIndex:2},a.name&&o().createElement(v.BM,{nonInteractive:!0,uri:a.uri,name:a.name},o().createElement(I(),{searchWords:[p],textToHighlight:a.name,findChunks:C,highlightClassName:P.Z.filterHighlight}))),o().createElement(v.mU,{ariaColIndex:3},o().createElement(v.A$,{duration:r}),o().createElement(v.Zv,{menu:o().createElement(j.N,{uri:e,uid:t,contextUri:g}),label:m.ag.get("more.label.track",l,N)})))))}),((e,t)=>e.uri===t.uri&&e.index===t.index));var N=l(78462);const B=new Set(N.MI),Q=o().memo((({uri:e,tracks:t,columns:l,sortState:r,handleSort:n,usePlayContextItem:a,tracklistDomRef:i})=>{const s=(0,c.useRef)(null),u=(0,c.useCallback)(((t,l)=>{const r=(0,C.X)(t.album.images,{desiredSize:40,desiredLabel:"small"});return o().createElement(U,{key:t.uid,index:l,contextUri:e,uri:t.uri,uid:t.uid,isPlayable:t.isPlayable,duration_ms:t.duration.milliseconds,name:t.name,artists:t.artists,album:t.album,isExplicit:t.isExplicit,isMOGEFRestricted:t.is19PlusOnly,type:t.type,imgUrl:(null==r?void 0:r.url)||"",usePlayContextItem:a})}),[e,a]);return o().createElement(o().Fragment,null,o().createElement(k.ZP,{value:"playlist-tracklist"},o().createElement(h.Pv,{key:e,ariaLabel:m.ag.get("local-files"),hasHeaderRow:!0,columns:l,sortableColumns:B,sortState:r,onSort:n,renderRow:u,resolveUri:e=>e.uri,resolveUid:e=>e.uid,tracks:t,nrTracks:t.length,limit:100,outerRef:s,outerDomRef:i})))}));var M=l(19565),_=l(66393),z=l(72131),F=l(36132),K=l(61048),H=l(31595),L=l(68942),W=l(32129),Z=l(84242),q=l(1169),G=l(5229);function X(e,t){var l=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),l.push.apply(l,r)}return l}function J(e){for(var t=1;t<arguments.length;t++){var l=null!=arguments[t]?arguments[t]:{};t%2?X(Object(l),!0).forEach((function(t){n()(e,t,l[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(l)):X(Object(l)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(l,t))}))}return e}const $=[h.QD.INDEX,h.QD.TITLE,h.QD.ALBUM,h.QD.DURATION],V=()=>{const{filter:e}=(0,c.useContext)(T.fo),{sortState:t,setSortState:l}=(0,c.useContext)(N.Gb),r=(0,c.useContext)(_.t),[n]=(0,G.z)(L.J,!1),h=(0,f.sn)(),[k,C]=(0,c.useState)([]),P=(0,H.Y)(a.Fzl),{filterBoxApiRef:v,filterBoxDomRef:D,tracklistDomRef:R,handleKeyDown:S}=(0,q.Q)(),O=(0,c.useCallback)((e=>{l((0,F.VK)(e,t))}),[t,l]),I=(0,c.useCallback)((async()=>{const l=await r.getContents({sort:(0,F._j)(t),filter:e});C(l.items)}),[r,t,e]);(0,c.useEffect)((()=>{I()}),[I]);const{isPlaying:w,togglePlay:j,usePlayContextItem:A}=(0,Z.n)({uri:z.bf,pages:[{items:k.map((e=>J(J({},e),{},{provider:null})))}]},{featureIdentifier:"local_files"});return h?0!==h.totalLength&&n?o().createElement("div",{role:"presentation",className:s,onKeyDown:S},o().createElement(y.gF,{backgroundColor:P},o().createElement(E.W,null,o().createElement(b.$,{size:d.qE.sm,onClick:()=>j(),isPlaying:w,uri:z.bf}),o().createElement(p.i,{text:m.ag.get("local-files")})),o().createElement(y.sP,null,o().createElement(y.xd,null,m.ag.get("local-files")),o().createElement(y.T0,null,m.ag.get("local-files.description")))),o().createElement(g.o,{backgroundColor:P},o().createElement(g.F,null,o().createElement(b.$,{size:d.qE.xl,onClick:()=>j(),isPlaying:w,uri:z.bf}),o().createElement("div",{className:u},o().createElement(K.K,{placeholder:m.ag.get("playlist.search_in_playlist"),filterBoxApiRef:v,outerRef:D}),o().createElement(W.c,{columns:N.MI})))),o().createElement("div",{className:"contentSpacing"},o().createElement(Q,{tracks:k,uri:z.bf,columns:$,handleSort:O,sortState:t,usePlayContextItem:A,tracklistDomRef:R}))):o().createElement(M.u,{linkTo:"/preferences",linkTitle:m.ag.get("local-files.empty-button"),message:m.ag.get("local-files.empty-description"),title:m.ag.get("local-files.empty-header")},o().createElement(i.X,{iconSize:64})):o().createElement(x.h,{errorMessage:m.ag.get("error.request-artist-failure")})},Y=()=>o().createElement(N.kz,{uri:"spotify:internal:local-files"},o().createElement(T.hz,{uri:"spotify:internal:local-files"},o().createElement(V,null)))},32129:(e,t,l)=>{l.d(t,{c:()=>m});var r=l(67294),n=l.n(r),a=l(28248),i=l(78462),c=l(36132),o=l(95289),s=l(5292);function u(e){return!!e}const m=({columns:e})=>{const t=[...e];t.splice(2,0,a.QD.ARTIST);const{sortState:l,setSortState:m}=(0,r.useContext)(i.Gb),d=function(e){return null===e.column?s.mE[a.QD.INDEX]:(0,c.cB)(e.column,e.order)?s.mE[a.QD.ARTIST]:s.mE[e.column]}(l),g=(0,r.useCallback)((e=>{m((0,s.WQ)(e,l.column,l.order))}),[m,l.column,l.order]),f=(0,r.useCallback)((()=>null!==l.column),[l.column]),E=t.map((e=>s.mE[e])).filter(u);return n().createElement(o.A,{options:E,onSelect:g,selected:d,isSelectionChanged:f,sortOrder:l.order})}},1169:(e,t,l)=>{l.d(t,{Q:()=>n});var r=l(67294);const n=()=>{const e=(0,r.useRef)(null),t=(0,r.useRef)(null),l=(0,r.useRef)(null);return{filterBoxApiRef:e,filterBoxDomRef:t,tracklistDomRef:l,handleKeyDown:r=>{var n,a,i;"Escape"===r.key&&((null!==(n=t.current)&&void 0!==n&&n.contains(r.target)||null!==(a=l.current)&&void 0!==a&&a.contains(r.target))&&(null===(i=e.current)||void 0===i||i.clearFilter()))}}}}}]);
//# sourceMappingURL=xpui-routes-collection-local-files.js.map