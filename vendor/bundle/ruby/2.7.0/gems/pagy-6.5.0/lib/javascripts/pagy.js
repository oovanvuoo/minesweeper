!function(){let e=(()=>{let e=new ResizeObserver(e=>e.forEach(e=>e.target.querySelectorAll(".pagy-rjs").forEach(e=>e.pagyRender()))),t=(t,[r,a,n,i])=>{let l=t.parentElement??t,p=Object.keys(a).map(e=>parseInt(e)).sort((e,t)=>t-e),c=-1,s=(e,t,r)=>e.replace(/__pagy_page__/g,t).replace(/__pagy_label__/g,r);(t.pagyRender=function(){let e=p.find(e=>e<l.clientWidth)||0;if(e===c)return;let g=r.before,y=a[e.toString()],f=n?.[e.toString()]??y.map(e=>e.toString());for(let e in y){let t=y[e],a=f[e];"string"==typeof i&&1===t?g+=o(s(r.link,t.toString(),a),i):"number"==typeof t?g+=s(r.link,t.toString(),a):"gap"===t?g+=r.gap:g+=s(r.active,t,a)}g+=r.after,t.innerHTML="",t.insertAdjacentHTML("afterbegin",g),c=e})(),t.classList.contains("pagy-rjs")&&e.observe(l)},r=(e,[t,r])=>n(e,e=>[e,t.replace(/__pagy_page__/,e)],r),a=(e,[t,r,a])=>{n(e,e=>{let a=Math.max(Math.ceil(t/parseInt(e)),1).toString(),n=r.replace(/__pagy_page__/,a).replace(/__pagy_items__/,e);return[a,n]},a)},n=(e,t,r)=>{let a=e.querySelector("input"),n=a.value,i=function(){if(a.value===n)return;let[i,l,p]=[a.min,a.value,a.max].map(e=>parseInt(e)||0);if(l<i||l>p){a.value=n,a.select();return}let[c,s]=t(a.value);"string"==typeof r&&"1"===c&&(s=o(s,r)),e.insertAdjacentHTML("afterbegin",s),e.querySelector("a").click()};["change","focus"].forEach(e=>a.addEventListener(e,a.select)),a.addEventListener("focusout",i),a.addEventListener("keypress",e=>{"Enter"===e.key&&i()})},o=(e,t)=>e.replace(RegExp(`(\\?|&amp;)${t}=1\\b(?!&amp;)|\\b${t}=1&amp;`),"");return{version:"6.5.0",init(e){for(let n of(e instanceof Element?e:document).querySelectorAll("[data-pagy]"))try{let e=Uint8Array.from(atob(n.getAttribute("data-pagy")),e=>e.charCodeAt(0)),[o,...i]=JSON.parse(new TextDecoder().decode(e));"nav"===o?t(n,i):"combo"===o?r(n,i):"selector"===o?a(n,i):console.warn("Skipped Pagy.init() for: %o\nUnknown keyword '%s'",n,o)}catch(e){console.warn("Skipped Pagy.init() for: %o\n%s",n,e)}}}})();window.Pagy=e}();