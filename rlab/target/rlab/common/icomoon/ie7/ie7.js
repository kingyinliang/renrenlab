/* To avoid CSS expressions while still supporting IE 7 and IE 6, use this script */
/* The script tag referencing this file must be placed before the ending body tag. */

/* Use conditional comments in order to target IE 7 and older:
	<!--[if lt IE 8]><!-->
	<script src="ie7/ie7.js"></script>
	<!--<![endif]-->
*/

(function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'icomoon\'">' + entity + '</span>' + html;
	}
	var icons = {
		'lab-add_type1': '&#xe900;',
		'lab-addicon': '&#xe901;',
		'lab-adress': '&#xe902;',
		'lab-alter': '&#xe903;',
		'lab-arrow-down': '&#xe904;',
		'lab-arrow-left': '&#xe905;',
		'lab-arrow-right': '&#xe906;',
		'lab-arrow-up': '&#xe907;',
		'lab-await': '&#xe908;',
		'lab-back_1': '&#xe909;',
		'lab-back_top': '&#xe90a;',
		'lab-biaoqian_1': '&#xe90b;',
		'lab-biaoqian_2': '&#xe90c;',
		'lab-caidan_1': '&#xe90d;',
		'lab-checked-1': '&#xe90e;',
		'lab-checked-2': '&#xe90f;',
		'lab-checked-3': '&#xe910;',
		'lab-close-1': '&#xe911;',
		'lab-close-2': '&#xe912;',
		'lab-commont': '&#xe913;',
		'lab-company': '&#xe914;',
		'lab-coupon': '&#xe915;',
		'lab-data': '&#xe916;',
		'lab-del': '&#xe917;',
		'lab-del_type1': '&#xe918;',
		'lab-dian_fang': '&#xe919;',
		'lab-dian_small': '&#xe91a;',
		'lab-dian_zan': '&#xe91b;',
		'lab-dianhua_1': '&#xe91c;',
		'lab-dot-1': '&#xe91d;',
		'lab-down': '&#xe91e;',
		'lab-erweima': '&#xe91f;',
		'lab-exit': '&#xe920;',
		'lab-fabu': '&#xe921;',
		'lab-gantanhao': '&#xe922;',
		'lab-godAdress': '&#xe923;',
		'lab-godPrice': '&#xe924;',
		'lab-godScheme': '&#xe925;',
		'lab-godTime': '&#xe926;',
		'lab-gouxuan_1': '&#xe927;',
		'lab-guanbi_1': '&#xe928;',
		'lab-guanbi_2': '&#xe929;',
		'lab-history': '&#xe92a;',
		'lab-home': '&#xe92b;',
		'lab-identifying-code': '&#xe92c;',
		'lab-im': '&#xe92d;',
		'lab-instrument': '&#xe92e;',
		'lab-lock': '&#xe92f;',
		'lab-more': '&#xe930;',
		'lab-order': '&#xe931;',
		'lab-phone': '&#xe932;',
		'lab-phone-2': '&#xe933;',
		'lab-phone-type-2': '&#xe934;',
		'lab-qr-code-1': '&#xe935;',
		'lab-renzheng_1': '&#xe936;',
		'lab-renzheng_2': '&#xe937;',
		'lab-return': '&#xe938;',
		'lab-scheme': '&#xe939;',
		'lab-search': '&#xe93a;',
		'lab-service': '&#xe93b;',
		'lab-set': '&#xe93c;',
		'lab-shangchuan_1': '&#xe93d;',
		'lab-shangchuan_2': '&#xe93e;',
		'lab-share-1': '&#xe93f;',
		'lab-shuaxin_1': '&#xe940;',
		'lab-stick': '&#xe941;',
		'lab-tip': '&#xe942;',
		'lab-tongguo_1': '&#xe943;',
		'lab-top': '&#xe944;',
		'lab-user': '&#xe945;',
		'lab-yanjing': '&#xe946;',
		'lab-youjian_1': '&#xe947;',
		'lab-zuobiao': '&#xe948;',
		'0': 0
		},
		els = document.getElementsByTagName('*'),
		i, c, el;
	for (i = 0; ; i += 1) {
		el = els[i];
		if(!el) {
			break;
		}
		c = el.className;
		c = c.match(/lab-[^\s'"]+/);
		if (c && icons[c[0]]) {
			addIcon(el, icons[c[0]]);
		}
	}
}());
