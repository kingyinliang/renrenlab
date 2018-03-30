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
		'lab-add_1': '&#xe900;',
		'lab-add_2': '&#xe901;',
		'lab-add_type1': '&#xe902;',
		'lab-addicon': '&#xe903;',
		'lab-adress': '&#xe904;',
		'lab-alter': '&#xe905;',
		'lab-arrow-down': '&#xe906;',
		'lab-arrow-left': '&#xe907;',
		'lab-arrow-right': '&#xe908;',
		'lab-arrow-up': '&#xe909;',
		'lab-await': '&#xe90a;',
		'lab-back_1': '&#xe90b;',
		'lab-back_top': '&#xe90c;',
		'lab-biaoqian_1': '&#xe90d;',
		'lab-biaoqian_2': '&#xe90e;',
		'lab-caidan_1': '&#xe90f;',
		'lab-checked-1': '&#xe910;',
		'lab-checked-2': '&#xe911;',
		'lab-checked-3': '&#xe912;',
		'lab-classify': '&#xe913;',
		'lab-close_2': '&#xe914;',
		'lab-close-1': '&#xe915;',
		'lab-close-2': '&#xe916;',
		'lab-commont': '&#xe917;',
		'lab-company': '&#xe918;',
		'lab-coupon': '&#xe919;',
		'lab-data': '&#xe91a;',
		'lab-del': '&#xe91b;',
		'lab-del_type1': '&#xe91c;',
		'lab-demand': '&#xe91d;',
		'lab-dengpao': '&#xe91e;',
		'lab-dian_fang': '&#xe91f;',
		'lab-dian_small': '&#xe920;',
		'lab-dian_zan': '&#xe921;',
		'lab-dianhua_1': '&#xe922;',
		'lab-dot-1': '&#xe923;',
		'lab-down': '&#xe924;',
		'lab-erweima': '&#xe925;',
		'lab-exit': '&#xe926;',
		'lab-fabu': '&#xe927;',
		'lab-gantanhao': '&#xe928;',
		'lab-gantanhao_1': '&#xe929;',
		'lab-godAdress': '&#xe92a;',
		'lab-godPrice': '&#xe92b;',
		'lab-godScheme': '&#xe92c;',
		'lab-godTime': '&#xe92d;',
		'lab-gouxuan_1': '&#xe92e;',
		'lab-guanbi_1': '&#xe92f;',
		'lab-guanbi_2': '&#xe930;',
		'lab-history': '&#xe931;',
		'lab-home': '&#xe932;',
		'lab-identifying-code': '&#xe933;',
		'lab-im': '&#xe934;',
		'lab-instrument': '&#xe935;',
		'lab-lock': '&#xe936;',
		'lab-mine': '&#xe937;',
		'lab-mobilehome': '&#xe938;',
		'lab-more': '&#xe939;',
		'lab-order': '&#xe93a;',
		'lab-order_1': '&#xe93b;',
		'lab-phone': '&#xe93c;',
		'lab-phone-2': '&#xe93d;',
		'lab-phone-type-2': '&#xe93e;',
		'lab-qr-code-1': '&#xe93f;',
		'lab-renzheng_1': '&#xe940;',
		'lab-renzheng_2': '&#xe941;',
		'lab-return': '&#xe942;',
		'lab-scheme': '&#xe943;',
		'lab-search': '&#xe944;',
		'lab-service': '&#xe945;',
		'lab-set': '&#xe946;',
		'lab-shangchuan_1': '&#xe947;',
		'lab-shangchuan_2': '&#xe948;',
		'lab-shangla_small_2': '&#xe949;',
		'lab-shangla_small_3': '&#xe94a;',
		'lab-share-1': '&#xe94b;',
		'lab-shuaxin_1': '&#xe94c;',
		'lab-stick': '&#xe94d;',
		'lab-tip': '&#xe94e;',
		'lab-tongguo_1': '&#xe94f;',
		'lab-top': '&#xe950;',
		'lab-user': '&#xe951;',
		'lab-xiala_small_2': '&#xe952;',
		'lab-yanjing': '&#xe953;',
		'lab-youjian_1': '&#xe954;',
		'lab-zuobiao': '&#xe955;',
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
