" vim:foldmethod=marker:fen:sw=4
scriptencoding utf-8


" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}


function! eskk#table#rom_to_kata_for_azik#load() abort
  return {
        \   'a': ['ア', ''],
        \   'i': ['イ', ''],
        \   'u': ['ウ', ''],
        \   'e': ['エ', ''],
        \   'o': ['オ', ''],
        \   'ka': ['カ', ''],
        \   'ki': ['キ', ''],
        \   'ku': ['ク', ''],
        \   'ke': ['ケ', ''],
        \   'ko': ['コ', ''],
        \   'sa': ['サ', ''],
        \   'si': ['シ', ''],
        \   'su': ['ス', ''],
        \   'se': ['セ', ''],
        \   'so': ['ソ', ''],
        \   'ta': ['タ', ''],
        \   'ti': ['チ', ''],
        \   'tu': ['ツ', ''],
        \   'te': ['テ', ''],
        \   'to': ['ト', ''],
        \   'na': ['ナ', ''],
        \   'ni': ['ニ', ''],
        \   'nu': ['ヌ', ''],
        \   'ne': ['ネ', ''],
        \   'no': ['ノ', ''],
        \   'ha': ['ハ', ''],
        \   'hi': ['ヒ', ''],
        \   'hu': ['フ', ''],
        \   'he': ['ヘ', ''],
        \   'ho': ['ホ', ''],
        \   'fu': ['フ', ''],
        \   'ma': ['マ', ''],
        \   'mi': ['ミ', ''],
        \   'mu': ['ム', ''],
        \   'me': ['メ', ''],
        \   'mo': ['モ', ''],
        \   'ya': ['ヤ', ''],
        \   'yu': ['ユ', ''],
        \   'yo': ['ヨ', ''],
        \   'ra': ['ラ', ''],
        \   'ri': ['リ', ''],
        \   'ru': ['ル', ''],
        \   're': ['レ', ''],
        \   'ro': ['ロ', ''],
        \   'wa': ['ワ', ''],
        \   'wo': ['ヲ', ''],
        \   'kz': ['カン', ''],
        \   'kn': ['カン', ''],
        \   'kk': ['キン', ''],
        \   'kj': ['クン', ''],
        \   'kd': ['ケン', ''],
        \   'kl': ['コン', ''],
        \   'sz': ['サン', ''],
        \   'sn': ['サン', ''],
        \   'sk': ['シン', ''],
        \   'sj': ['スン', ''],
        \   'sd': ['セン', ''],
        \   'sl': ['ソン', ''],
        \   'tz': ['タン', ''],
        \   'tn': ['タン', ''],
        \   'tk': ['チン', ''],
        \   'tj': ['ツン', ''],
        \   'td': ['テン', ''],
        \   'tl': ['トン', ''],
        \   'nz': ['ナン', ''],
        \   'nn': ['ン', ''],
        \   'nk': ['ニン', ''],
        \   'nj': ['ヌン', ''],
        \   'nd': ['ネン', ''],
        \   'nl': ['ノン', ''],
        \   'hz': ['ハン', ''],
        \   'hn': ['ハン', ''],
        \   'hk': ['ヒン', ''],
        \   'hj': ['フン', ''],
        \   'hd': ['ヘン', ''],
        \   'hl': ['ホン', ''],
        \   'fz': ['ファン', ''],
        \   'fn': ['ファン', ''],
        \   'fk': ['フィン', ''],
        \   'fj': ['フン', ''],
        \   'fd': ['フェン', ''],
        \   'fl': ['フォン', ''],
        \   'mz': ['マン', ''],
        \   'mk': ['ミン', ''],
        \   'mj': ['ムン', ''],
        \   'md': ['メン', ''],
        \   'ml': ['モン', ''],
        \   'yz': ['ヤン', ''],
        \   'yn': ['ヤン', ''],
        \   'yj': ['ユン', ''],
        \   'yl': ['ヨン', ''],
        \   'rz': ['ラン', ''],
        \   'rn': ['ラン', ''],
        \   'rk': ['リン', ''],
        \   'rj': ['ルン', ''],
        \   'rd': ['レン', ''],
        \   'rl': ['ロン', ''],
        \   'wz': ['ワン', ''],
        \   'wn': ['ワン', ''],
        \   'wk': ['ウィン', ''],
        \   'wd': ['ウェン', ''],
        \   'wl': ['ウォン', ''],
        \   'kq': ['カイ', ''],
        \   'kh': ['クウ', ''],
        \   'kw': ['ケイ', ''],
        \   'kp': ['コウ', ''],
        \   'sq': ['サイ', ''],
        \   'sh': ['スウ', ''],
        \   'sw': ['セイ', ''],
        \   'sp': ['ソウ', ''],
        \   'tq': ['タイ', ''],
        \   'th': ['ツウ', ''],
        \   'tw': ['テイ', ''],
        \   'tp': ['トウ', ''],
        \   'nq': ['ナイ', ''],
        \   'nh': ['ヌウ', ''],
        \   'nw': ['ネイ', ''],
        \   'np': ['ノウ', ''],
        \   'hq': ['ハイ', ''],
        \   'hh': ['フウ', ''],
        \   'hw': ['ヘイ', ''],
        \   'hp': ['ホウ', ''],
        \   'fq': ['ファイ', ''],
        \   'fh': ['フウ', ''],
        \   'fw': ['フェイ', ''],
        \   'fp': ['フォー', ''],
        \   'mq': ['マイ', ''],
        \   'mh': ['ムウ', ''],
        \   'mw': ['メイ', ''],
        \   'mp': ['モウ', ''],
        \   'yq': ['ヤイ', ''],
        \   'yh': ['ユウ', ''],
        \   'yp': ['ヨウ', ''],
        \   'rq': ['ライ', ''],
        \   'rh': ['ルウ', ''],
        \   'rw': ['レイ', ''],
        \   'rp': ['ロウ', ''],
        \   'wq': ['ワイ', ''],
        \   'wp': ['ウォー', ''],
        \   'ga': ['ガ', ''],
        \   'gi': ['ギ', ''],
        \   'gu': ['グ', ''],
        \   'ge': ['ゲ', ''],
        \   'go': ['ゴ', ''],
        \   'za': ['ザ', ''],
        \   'zi': ['ジ', ''],
        \   'zu': ['ズ', ''],
        \   'ze': ['ゼ', ''],
        \   'zo': ['ゾ', ''],
        \   'ji': ['ジ', ''],
        \   'da': ['ダ', ''],
        \   'di': ['ヂ', ''],
        \   'du': ['ヅ', ''],
        \   'de': ['デ', ''],
        \   'do': ['ド', ''],
        \   'ba': ['バ', ''],
        \   'bi': ['ビ', ''],
        \   'bu': ['ブ', ''],
        \   'be': ['ベ', ''],
        \   'bo': ['ボ', ''],
        \   'pa': ['パ', ''],
        \   'pi': ['ピ', ''],
        \   'pu': ['プ', ''],
        \   'pe': ['ペ', ''],
        \   'po': ['ポ', ''],
        \   'gz': ['ガン', ''],
        \   'gn': ['ガン', ''],
        \   'gk': ['ギン', ''],
        \   'gj': ['グン', ''],
        \   'gd': ['ゲン', ''],
        \   'gl': ['ゴン', ''],
        \   'zz': ['ザン', ''],
        \   'zn': ['ザン', ''],
        \   'zk': ['ジン', ''],
        \   'zj': ['ズン', ''],
        \   'zd': ['ゼン', ''],
        \   'zl': ['ゾン', ''],
        \   'dz': ['ダン', ''],
        \   'dn': ['ダン', ''],
        \   'dk': ['ヂン', ''],
        \   'dj': ['ヅン', ''],
        \   'dd': ['デン', ''],
        \   'dl': ['ドン', ''],
        \   'bz': ['バン', ''],
        \   'bn': ['バン', ''],
        \   'bk': ['ビン', ''],
        \   'bj': ['ブン', ''],
        \   'bd': ['ベン', ''],
        \   'bl': ['ボン', ''],
        \   'pz': ['パン', ''],
        \   'pn': ['パン', ''],
        \   'pk': ['ピン', ''],
        \   'pj': ['プン', ''],
        \   'pd': ['ペン', ''],
        \   'pl': ['ポン', ''],
        \   'gq': ['ガイ', ''],
        \   'gh': ['グウ', ''],
        \   'gw': ['ゲイ', ''],
        \   'gp': ['ゴウ', ''],
        \   'zq': ['ザイ', ''],
        \   'zh': ['ズウ', ''],
        \   'zw': ['ゼイ', ''],
        \   'zp': ['ゾウ', ''],
        \   'dq': ['ダイ', ''],
        \   'dh': ['ヅウ', ''],
        \   'dw': ['デイ', ''],
        \   'dp': ['ドウ', ''],
        \   'bq': ['バイ', ''],
        \   'bh': ['ブウ', ''],
        \   'bw': ['ベイ', ''],
        \   'bp': ['ボウ', ''],
        \   'pq': ['パイ', ''],
        \   'ph': ['プウ', ''],
        \   'pw': ['ペイ', ''],
        \   'pp': ['ポウ', ''],
        \   'zc': ['ザ', ''],
        \   'zv': ['ザイ', ''],
        \   'zx': ['ゼイ', ''],
        \   'kya': ['キャ', ''],
        \   'kga': ['キャ', ''],
        \   'sya': ['シャ', ''],
        \   'tya': ['チャ', ''],
        \   'ca': ['チャ', ''],
        \   'nya': ['ニャ', ''],
        \   'nga': ['ニャ', ''],
        \   'hya': ['ヒャ', ''],
        \   'hga': ['ヒャ', ''],
        \   'mya': ['ミャ', ''],
        \   'mga': ['ミャ', ''],
        \   'rya': ['リャ', ''],
        \   'kyu': ['キュ', ''],
        \   'kgu': ['キュ', ''],
        \   'syu': ['シュ', ''],
        \   'xu': ['シュ', ''],
        \   'tyu': ['チュ', ''],
        \   'cu': ['チュ', ''],
        \   'nyu': ['ニュ', ''],
        \   'ngu': ['ニュ', ''],
        \   'hyu': ['ヒュ', ''],
        \   'hgu': ['ヒュ', ''],
        \   'myu': ['ミュ', ''],
        \   'mgu': ['ミュ', ''],
        \   'ryu': ['リュ', ''],
        \   'kye': ['キェ', ''],
        \   'kge': ['キェ', ''],
        \   'sye': ['シェ', ''],
        \   'xa': ['シャ', ''],
        \   'xe': ['シェ', ''],
        \   'tye': ['チェ', ''],
        \   'ce': ['チェ', ''],
        \   'nye': ['ニェ', ''],
        \   'nge': ['ニェ', ''],
        \   'hye': ['ヒェ', ''],
        \   'hge': ['ヒェ', ''],
        \   'mye': ['ミェ', ''],
        \   'mge': ['ミェ', ''],
        \   'rye': ['リェ', ''],
        \   'kyo': ['キョ', ''],
        \   'kgo': ['キョ', ''],
        \   'syo': ['ショ', ''],
        \   'xo': ['ショ', ''],
        \   'tyo': ['チョ', ''],
        \   'co': ['チョ', ''],
        \   'nyo': ['ニョ', ''],
        \   'ngo': ['ニョ', ''],
        \   'hyo': ['ヒョ', ''],
        \   'hgo': ['ヒョ', ''],
        \   'myo': ['ミョ', ''],
        \   'mgo': ['ミョ', ''],
        \   'ryo': ['リョ', ''],
        \   'kyz': ['キャン', ''],
        \   'kgz': ['キャン', ''],
        \   'syz': ['シャン', ''],
        \   'xz': ['シャン', ''],
        \   'tyz': ['チャン', ''],
        \   'cz': ['チャン', ''],
        \   'nyz': ['ニャン', ''],
        \   'ngz': ['ニャン', ''],
        \   'hyz': ['ヒャン', ''],
        \   'hgz': ['ヒャン', ''],
        \   'myz': ['ミャン', ''],
        \   'mgz': ['ミャン', ''],
        \   'ryz': ['リャン', ''],
        \   'kyn': ['キャン', ''],
        \   'kgn': ['キャン', ''],
        \   'syn': ['シャン', ''],
        \   'xn': ['シャン', ''],
        \   'tyn': ['チャン', ''],
        \   'cn': ['チャン', ''],
        \   'nyn': ['ニャン', ''],
        \   'ngn': ['ニャン', ''],
        \   'hyn': ['ヒャン', ''],
        \   'hgn': ['ヒャン', ''],
        \   'myn': ['ミャン', ''],
        \   'mgn': ['ミャン', ''],
        \   'ryn': ['リャン', ''],
        \   'kyj': ['キュン', ''],
        \   'kgj': ['キュン', ''],
        \   'syj': ['シュン', ''],
        \   'xj': ['シュン', ''],
        \   'tyj': ['チュン', ''],
        \   'cj': ['チュン', ''],
        \   'nyj': ['ニュン', ''],
        \   'ngj': ['ニュン', ''],
        \   'hyj': ['ヒュン', ''],
        \   'hgj': ['ヒュン', ''],
        \   'myj': ['ミュン', ''],
        \   'mgj': ['ミュン', ''],
        \   'ryj': ['リュン', ''],
        \   'kyd': ['キェン', ''],
        \   'kgd': ['キェン', ''],
        \   'syd': ['シェン', ''],
        \   'xd': ['シェン', ''],
        \   'tyd': ['チェン', ''],
        \   'cd': ['チェン', ''],
        \   'nyd': ['ニェン', ''],
        \   'ngd': ['ニェン', ''],
        \   'hyd': ['ヒェン', ''],
        \   'hgd': ['ヒェン', ''],
        \   'myd': ['ミェン', ''],
        \   'mgd': ['ミェン', ''],
        \   'ryd': ['リェン', ''],
        \   'kyl': ['キョン', ''],
        \   'kgl': ['キョン', ''],
        \   'syl': ['ション', ''],
        \   'xl': ['ション', ''],
        \   'tyl': ['チョン', ''],
        \   'cl': ['チョン', ''],
        \   'nyl': ['ニョン', ''],
        \   'ngl': ['ニョン', ''],
        \   'hyl': ['ヒョン', ''],
        \   'hgl': ['ヒョン', ''],
        \   'myl': ['ミョン', ''],
        \   'mgl': ['ミョン', ''],
        \   'ryl': ['リョン', ''],
        \   'kyq': ['キャイ', ''],
        \   'kgq': ['キャイ', ''],
        \   'syq': ['シャイ', ''],
        \   'xq': ['シャイ', ''],
        \   'tyq': ['チャイ', ''],
        \   'cq': ['チャイ', ''],
        \   'nyq': ['ニャイ', ''],
        \   'ngq': ['ニャイ', ''],
        \   'hyq': ['ヒャイ', ''],
        \   'hgq': ['ヒャイ', ''],
        \   'myq': ['ミャイ', ''],
        \   'mgq': ['ミャイ', ''],
        \   'ryq': ['リャイ', ''],
        \   'kyh': ['キュウ', ''],
        \   'kgh': ['キュウ', ''],
        \   'syh': ['シュウ', ''],
        \   'xh': ['シュウ', ''],
        \   'tyh': ['チュウ', ''],
        \   'ch': ['チュウ', ''],
        \   'nyh': ['ニュウ', ''],
        \   'ngh': ['ニュウ', ''],
        \   'hyh': ['ヒュウ', ''],
        \   'hgh': ['ヒュウ', ''],
        \   'myh': ['ミュウ', ''],
        \   'mgh': ['ミュウ', ''],
        \   'ryh': ['リュウ', ''],
        \   'kyw': ['キェイ', ''],
        \   'kgw': ['キェイ', ''],
        \   'syw': ['シェイ', ''],
        \   'xw': ['シェイ', ''],
        \   'tyw': ['チェイ', ''],
        \   'cw': ['チェイ', ''],
        \   'nyw': ['ニェイ', ''],
        \   'ngw': ['ニェイ', ''],
        \   'hyw': ['ヒェイ', ''],
        \   'hgw': ['ヒェイ', ''],
        \   'myw': ['ミェイ', ''],
        \   'mgw': ['ミェイ', ''],
        \   'ryw': ['リェイ', ''],
        \   'kyp': ['キョウ', ''],
        \   'kgp': ['キョウ', ''],
        \   'syp': ['ショウ', ''],
        \   'xp': ['ショウ', ''],
        \   'typ': ['チョウ', ''],
        \   'cp': ['チョウ', ''],
        \   'nyp': ['ニョウ', ''],
        \   'ngp': ['ニョウ', ''],
        \   'hyp': ['ヒョウ', ''],
        \   'hgp': ['ヒョウ', ''],
        \   'myp': ['ミョウ', ''],
        \   'mgp': ['ミョウ', ''],
        \   'ryp': ['リョウ', ''],
        \   'gya': ['ギャ', ''],
        \   'zya': ['ジャ', ''],
        \   'ja': ['ジャ', ''],
        \   'bya': ['ビャ', ''],
        \   'pya': ['ピャ', ''],
        \   'pga': ['ピャ', ''],
        \   'gyu': ['ギュ', ''],
        \   'zyu': ['ジュ', ''],
        \   'ju': ['ジュ', ''],
        \   'byu': ['ビュ', ''],
        \   'pyu': ['ピュ', ''],
        \   'pgu': ['ピュ', ''],
        \   'gye': ['ギェ', ''],
        \   'zye': ['ジェ', ''],
        \   'je': ['ジェ', ''],
        \   'bye': ['ビェ', ''],
        \   'pye': ['ピェ', ''],
        \   'pge': ['ピェ', ''],
        \   'gyo': ['ギョ', ''],
        \   'zyo': ['ジョ', ''],
        \   'jo': ['ジョ', ''],
        \   'byo': ['ビョ', ''],
        \   'pyo': ['ピョ', ''],
        \   'pgo': ['ピョ', ''],
        \   'gyz': ['ギャン', ''],
        \   'zyz': ['ジャン', ''],
        \   'jz': ['ジャン', ''],
        \   'byz': ['ビャン', ''],
        \   'pyz': ['ピャン', ''],
        \   'pgz': ['ピャン', ''],
        \   'gyn': ['ギャン', ''],
        \   'zyn': ['ジャン', ''],
        \   'jn': ['ジャン', ''],
        \   'byn': ['ビャン', ''],
        \   'pyn': ['ピャン', ''],
        \   'pgn': ['ピャン', ''],
        \   'gyj': ['ギュン', ''],
        \   'zyj': ['ジュン', ''],
        \   'jj': ['ジュン', ''],
        \   'byj': ['ビュン', ''],
        \   'pyj': ['ピュン', ''],
        \   'pgj': ['ピュン', ''],
        \   'gyd': ['ギェン', ''],
        \   'zyd': ['ジェン', ''],
        \   'jd': ['ジェン', ''],
        \   'byd': ['ビェン', ''],
        \   'pyd': ['ピェン', ''],
        \   'pgd': ['ピェン', ''],
        \   'gyl': ['ギョン', ''],
        \   'zyl': ['ジョン', ''],
        \   'jl': ['ジョン', ''],
        \   'byl': ['ビョン', ''],
        \   'pyl': ['ピョン', ''],
        \   'pgl': ['ピョン', ''],
        \   'gyq': ['ギャイ', ''],
        \   'zyq': ['ジャイ', ''],
        \   'jq': ['ジャイ', ''],
        \   'byq': ['ビャイ', ''],
        \   'pyq': ['ピャイ', ''],
        \   'pgq': ['ピャイ', ''],
        \   'gyh': ['ギュウ', ''],
        \   'zyh': ['ジュウ', ''],
        \   'jh': ['ジュウ', ''],
        \   'byh': ['ビュウ', ''],
        \   'pyh': ['ピュウ', ''],
        \   'pgh': ['ピュウ', ''],
        \   'gyw': ['ギェイ', ''],
        \   'zyw': ['ジェイ', ''],
        \   'jw': ['ジェイ', ''],
        \   'byw': ['ビェイ', ''],
        \   'pyw': ['ピェイ', ''],
        \   'pgw': ['ピェイ', ''],
        \   'gyp': ['ギョウ', ''],
        \   'zyp': ['ジョウ', ''],
        \   'jp': ['ジョウ', ''],
        \   'byp': ['ビョウ', ''],
        \   'pyp': ['ピョウ', ''],
        \   'pgp': ['ピョウ', ''],
        \   'fa': ['ファ', ''],
        \   'va': ['ヴァ', ''],
        \   'la': ['ァ', ''],
        \   'lya': ['ャ', ''],
        \   'fi': ['フィ', ''],
        \   'vi': ['ヴィ', ''],
        \   'tgi': ['ティ', ''],
        \   'dci': ['ディ', ''],
        \   'wi': ['ウィ', ''],
        \   'li': ['ィ', ''],
        \   'vu': ['ヴ', ''],
        \   'tgu': ['トゥ', ''],
        \   'dcu': ['ドゥ', ''],
        \   'lu': ['ゥ', ''],
        \   'lyu': ['ュ', ''],
        \   'fe': ['フェ', ''],
        \   've': ['ヴェ', ''],
        \   'we': ['ウェ', ''],
        \   'le': ['ェ', ''],
        \   'fo': ['フォ', ''],
        \   'vo': ['ヴォ', ''],
        \   'wso': ['ウォ', ''],
        \   'lo': ['ォ', ''],
        \   'lyo': ['ョ', ''],
        \   'q': ['ン', ''],
        \   'kt': ['コト', ''],
        \   'st': ['シタ', ''],
        \   'tt': ['タチ', ''],
        \   'ht': ['ヒト', ''],
        \   'wt': ['ワタ', ''],
        \   'mn': ['モノ', ''],
        \   'ms': ['マス', ''],
        \   'ds': ['デス', ''],
        \   'km': ['カモ', ''],
        \   'tm': ['タメ', ''],
        \   'dm': ['デモ', ''],
        \   'kr': ['カラ', ''],
        \   'sr': ['スル', ''],
        \   'tr': ['タラ', ''],
        \   'nr': ['ナル', ''],
        \   'yr': ['ヨル', ''],
        \   'rr': ['ラレ', ''],
        \   'zr': ['ザル', ''],
        \   'mt': ['マタ', ''],
        \   'tb': ['タビ', ''],
        \   'nb': ['ネバ', ''],
        \   'bt': ['ビト', ''],
        \   'gr': ['ガラ', ''],
        \   'gt': ['ゴト', ''],
        \   'nt': ['ニチ', ''],
        \   'dt': ['ダチ', ''],
        \   'wr': ['ワレ', ''],
        \   'wf': ['ワイ', ''],
        \   'sf': ['サイ', ''],
        \   'ss': ['セイ', ''],
        \   'zf': ['ゼ', ''],
        \   'jk': ['ジン', ''],
        \   '-': ['ー', ''],
        \   ':': ['ッ', ''],
        \   ';': ['；', ''],
        \   '!': ['！', ''],
        \   '?': ['？', ''],
        \   '[': ['「', ''],
        \   ']': ['」', ''],
        \   '.': ['。', ''],
        \   ',': ['、', ''],
        \}
endfunction


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
