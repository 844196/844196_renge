require 'ruboty/cron'
require 'time'

module Ruboty::Handlers
  class Renge < Base
    on /talk(?:.*)\z/i, name: 'talk', description: 'talk renge'
    on /say(?:.*)\z/i, name: 'say', description: 'say renge'

    def initialize(*args)
      super
      task = {body: "#{robot.name} say", id: 0, schedule: '0 0,12 * * *'}
      jobs = robot.brain.data['cron'] ||= {}
      job = Ruboty::Cron::Job.new(task)
      jobs[job.id] = job.to_hash
      job.start(robot)
    end

    def say(message)
      Ruboty.logger.info("Schedule event: say: #{Time.now}")
      message.reply(renge)
    end

    def talk(message)
      unless message.original[:retweeted]
        Ruboty.logger.info("Handle event: talk: #{message.body}")

        to = message.original[:from]
        str = renge

        msg = "@#{to} #{str}"

        message.reply(
          msg.length > 140 ? msg[0,137] + '...' : msg
        )
      end
    end

    private

    def renge
      dict = <<-'EOL'
... いん... もういいん...
... しなびてるけど......
... なっつん
... 今度はこのみ姉がいないん... さっきまで手見えてたんに どこいったん...
...... こんな時だからもう一度聞いておくのん...
...... た゛へ゛る゛ん゛！！
...... でもちゃんとお仕事しないと...
...... なかなかやみそうにないん...
...... なっつん......
...... なんでこんな滑った感じなのん？
...... なんでそんな瞬間否定なん...
...... ほたるんなー
...... もしかしてそれ ウチのマネなん...？
...... ん......
...... んー......
...... ウチ サワガニの方が好きなんに......
...... 一応言っとくと普通なら時速50キロで走っても赤信号あるから1時間後に50キロ先にはいけないってことですが
...... 大丈夫なのん 死んじゃうの嫌なん
...... 大丈夫なん 初日の出見るん
...... 姉ねぇ......
...... 時々ひよこっぽいの出てくるけど
...... 東京って空に浮いてるん......？
...... 紙は... 紙とかはどうなん？
...... 膝...... やっちまいました......
...... 調子に... のってる......
......... なんでないのん...
......... 駄菓子屋 本当に来ないん？
...？ これひらたいらさんなのん？
1人でやっても2人でやってもおもしろいん 駄菓子屋やるん？
36！！
7つになりましたん
81！！
「うん」しかいってないのん？
「おっちゃんこの大根まけてーなー」とかもあったのん
「虎柄をなめるんじゃないのん！」とかのが良かったん？
あいっ！！
あいー
あい！ じゃあ皆で木の実とりするーん！
あそこ！！ なんか窪みがあるのん！
あつめるのーん
あとこれに輪ゴムを通して... 姉々 前買った白いレインコートあるん？
あとでいいのん！
あと写真の代わりに絵送るーん
あと梅こぶ茶
あの時は楽しかったのに...... こまちゃん寝てる隙に額にいい感じの文字書き込んだときは......
あれなのん
あれはさすがにやりすぎなん あんなの平成時代じゃないん
あれはとってもいい感じでした......
あんなー！ 実は今日皆でお泊りすることになったん！！ お団子食べて夜まで遊べるん！！
あんなー？
あんな大きい魚見たんはじめてなんー
あーい
あーい わかったのーん
あ！！ 赤ちゃん顔だしたん！！
いい
いいことおもいついたん！ あれ 家にするのん！
いいこと思いついたん 紙のお皿あるん？
いいこと考えたん
いいな 飴
いいのん
いいのん！？ 遊ぶん遊ぶん！！
いくのーん！！
いじけてないのーん
いただきっ
いっぱいあるん
いっぱい食べて大きくなるん
いつのまにかもう4時なのん
いないん！！
う ウチも！ ウチも楽しかったのん！！
ううん？
ううん？ ウチ浮いてるのん！
うぉっけー
うそん...
うち おなかへったん
うち 新しい特技覚えたのーん
うち 果物とは戦うより食べたいのん
うちで勉強するん？ なっつんとほたるん 兄にいもくるんなー
うちなんでもいいん
うちの家は稲飾ってるん
うちもとる〜ん
うちも食べるーん
うち台車役やりたいー 新幹線ごっこー
うち妖精ごっこしたいん！！ こまちゃんも妖精になっていいん！！
うっさぎ小屋ー
うん
うん いい
えいさー
お 落ち着くのーん
おいでー おいでー
おぅよしよし
おう...
おお...
おお... セミ...っ！！
おおっ...
おかげでいい絵撮れましたっ！！
おかしいん... ちゃんと歌うたってたんに... しんどいん...
おくれー
おじゃましますーん
おだんごー
おっきくなったん！
おっけーなのん
おっ世話しっましょ小鳥さんっ
おてんとさまー
おまつり...
おまんじゅう！？
おみやげにするん
おめでとうございます！！
おもしろいの見えた？
おもち とんじるに入れるーん
おもちゃないなら鬼ごっこするのん
おもちゃないのん...
おー きゃめらー
おー りょうりなのーん？
おー りんごー
おー 妖精さんなん？
おー 雨の日だと砂掘りやすいんなー
おー世話しましょっうっさぎさんっ
お前も食べるん？
お団子！！ お団子！ 食べたいん！
お天道様......
お店いいのん？
お待たせなーん
お日様ー 晴れるのーん
お日様出てきたん！！
お水飲みに来たん
お洒落！！ なっつんがお洒落！？
お留守番嫌なん
お祭り始まったのかと思ったん...... でも宇宙人見たほうがもっとびっくりしたと思うん
お絵かきー お絵かきなのーん
お花の冠なん！！
お遊戯もするん あとなー... あとー...
お飲みになりますかー？
お餅7個食べるーん
お餅なーん！
お餅ー お餅ー ひっくりかえすーん
かっえるは大人ー おったまは子供ー 後ろ足生えたらすねかじりー 前足生えたら反抗期ー
かわいいポーズとかでいいん
きっと日頃の行いよかったからなんなー
きっと無理なのん
きてたん！！
くれよんもいるのんなー
こ これは呪文...？ ウチいきなりとんでもないものを取り出してしまったん...
こ... このみ姉の抜け殻...？
こ... こまちゃんとほたるんにも見せてきていいですのん！？
こいつの名前は「その日暮らし」にするーん
こいつの名前はお塩にするのん...
こうするのん
こうなったら皆が来る前にやる気出させる練習するん！
こうやって...
こうやって手を前にだして前かがみになりながらぶっうぉうぉーんっていって走るん！
こうやって裏から穴に顔をだして...
ここ ここおもしろいのん
ここ ウチの山なん
ここからのー
ここから学校まで距離あるし 飼育小屋に来てること誰にもいってないから注意もむかないかも知れないのん
ここにおもちゃあるのん？
ここに皮が...
ここの前のページのー
ここの山 全部ウチんちの土地なん
こっちいくん
こっちおーいでー
こっちこっちー すごいのーん
こっちなん！！ 早くん！！
こっちにいいものあるのん
こっちにいっぱい木の実なってるん！！
こっちに来れば人参もいっぱいくえるのーん
こっちのはエサいっぱい食べるん でこっちのは泳ぐのはやいん あっちのはー...
こっちー こっちに木の実あったーん
このたくさんのぬいぐるみ... さっきの練習という言葉...
このなめらかかつコシのある麺にはさすがのウチも気後れしてしまいます チョルン
このみちゃんも行くって言ってたん
このみ姉の親指とれちゃったん！！
このみ姉ー 来たーん
このみ姉！！ 勉強教えてほしいん！ ウチがんばるん！！
このよさがわかるとはさすがなっつん！
このエサを小屋に誘導するよう置いていって
このフィフティフィフティな卵... 本当にいらないのん...？
この匂い... カレーの匂いなのん！！
この村 妖怪しかいないん...
この格好 ふぁ... ...... ふぁん...
この格好ファンキーなん？
この花 好きになりましたん
こまちゃん こっちに目線をー
こまちゃん ぶつぶつ言わないで皆にお遊戯披露するん！
こまちゃん ほたるん オママゴトするのんー
こまちゃんお遊戯やるーん
こまちゃんこまちゃん
こまちゃんこれやるんこれー
こまちゃんなのん
こまちゃんほたるーん！
こまちゃんまだ終わってないーんっ
こまちゃんも来るのーん
こまちゃんファイっ
こまちゃん何して遊ぶかは 今日が何の日か考えればわかるん
こまちゃん何描くん？
こまちゃん探すのーーん！
こまちゃん泣くほど晴れてほしいんな
こまちゃん達家に来るん 皆で勉強するのん
こまちゃーん ウチと一緒に晴れるようお願いするのーん
こまちゃーん！
これすっぱいのん... でもなかなかいけなくもない...
これでお外いっていきていいん！？
これできたら前にもっていけばいいのん？
これでもう5度寝なん
これでオペをします！！
これで押さえ込みから逃げたり 逆に押さえ込みにもっていけるん
これどうしたらいいのん？
これどうするのん？
これなのん
これはウチが考えた最新のおもちゃなん
これはボブが間違ってるん
これは断じてごっこじゃないん！ れっきとした練習なん！
これは皆さんご存知のー... キリンさんですっ！！
これは見てのとおりー 皆さんご存知のー
これは長期戦になりそうなんなー
これもらっていいん！？
これー
これ学校の鞄なん？ 教科書みていいん？
これ拾ったん！
これ持ってくん
こんなごっこ遊びたくさんなん ウチの心が引き算なん
こんな小ささじゃお日様に見つけてもらえないのん...
こんな感じで遊ぶん！ マンガの最後みたいな感じなん！
こんな感じで！ こんな感じで2人とも頑張ってください！！
こんな裏技があったん！？
こーゆーガシャガシャは駄目なのん...
ごっ！！
ごはん持ってきた―ん
ごはーん！！
さすがねぇねぇ目のつけどころがちがうん！
さすが先人の知恵ー
さっきからそう言ってるんにー
さっきから皆変なのん！！ 何言ってるかわからないのん！！
さっきのにょぱにょぱは警戒心をなくす罠だったん！！ あの時から雪合戦は始まってたのーん！！
さっきの流れ的に どう見ても肉球なのん......
さっきの！ ウチの方が高く飛んだん！！
さっきまでのは思いついてないフリ... ちょっとした茶目っ気なん
さっき宇宙人の夢見たのん
しょうがないんなー じゃあウチとなっつんが妖精役なんなー
じ...
じゃ そのまままっすぐなーん そこ段差あるから気をつけるのーん
じゃ またあとでなーん
じゃ... じゃあ... セミオートるん！？ セミオートるん！？
じゃあ ウチねぇねぇと一緒の布団に寝るん
じゃあ4*8=32なん？
じゃあいくのん
じゃあいまからそっちいくん！！
じゃあおもちゃ探すのんー
じゃあこまちゃんお父さんでほたるん母さんなー
じゃあこれ 今からつかってみるん
じゃあどするのんー
じゃあなっつんいくのーん
じゃあもっかいやるのん！ 次こそはこまちゃんに勝つん！
じゃあもってくーん
じゃあウチ 帰るん
じゃあウチのモノマネ十八番 ちゃんと見てるのん
じゃあウチ勉強するふりするん 姉ねぇは先生としてやる気出させてほしいん！
じゃあウチ送ってくん
じゃあ手をこうやって「そすんさー」っていうん
じゃあ早く確認するのんっ！！
じゃあ本番の前に妖精の正しい飛び方教えるのん！！
じゃあ次はほたるんの番なのん！
じゃあ虫取りー
じゃあ高くとばした方の勝ちなんなー
じゃんけんのなー？ グーはチョキを刃こぼれさせて チョキはパーを切るから勝つんよなー？
じーつーはー さっきにょぱにょぱ言ってたのウチだったん
すぐ着替えてくるーん！
すぐ行くーん！
すごいてかってるんな
すごいのんなっつん！ かわいくなったん！！
すごいのん！ こういうの何て言うんだったかー
すごいんすごいん！！ ウチ初めて妖怪みたん！！ 本当にいたのんなー！！
すごいん！！ 皆あたってるん！！
するのーん
ずっと寝てるん でも忙しいって言ってるん
ずばり...っ！！ 芸術の秋なのんっ！！
ずばり！！ 夏休みの自由研究なのん！！
そ そうだったんなー ウチ知らずに起きろとか言ってたん ごめんなさいなのん
そ そうなんな ちょっとハメ外しすぎたん
そ そうなんな 落ち着くん...
そ そこにいたん
そういうことならお任せなん！！ ジャックナイフの柄の部分ことウチに！！
そういえばそこの花瓶何も飾らないのん？
そういえばセミのぬけがらにそっくりなのん
そういえば宿題いっぱい出てたん
そういえば昨日 ほたるん家じゃ子供っぽくなるっていってたん
そうかぁ 今日のニュースはエキサイチングだったのに
そうと決まったらなっつん達もスキーに呼ぶん！！
そうなのん こまちゃんモデルするん
そうなのん！！
そうなのん？
そうなん
そうなん このバケツとスコップで音だせばお日様に見つけてもらいやすくなるん
そうなん それとやる気出るように飴と鞭使い分けるん
そうなんなー
そうなんなー せっかく遊びに来たんにー
そうなんなー ちょっと見てみたいん
そうなんなー なんかわかりにくいん
そうなんなー 普通に考えたら人が脱皮するわけないん
そうなん！ なっつんの写真とるん！
そうなん？
そう！！ ウチがてるてるぼうずなのん！！
そこにうさぎさんが近づいてきたらもろこしより好物の人参で釣るので
そこはこまちゃんに任すのん
そしてこれが何を意味するか！ 今見せてあげるのん！！
そしてもっかいふけば次は具が芸をしますん！！
そすんさー
そすんすの使い手なん 人は彼らをこう呼ぶん
そなのん でも今日が芸術の秋であって欲しいん その心持ちなのん
そのままの意味なん 学校で文化祭するん ひか姉来れるん？
その約束はしてないん
その花食べれるん！？ なんて名前なん！？
それ おーとくちゅーるなのん！？
それいいのんなー
それでいいん
それでいいんな〜？
それでいいん！！ ヌシ釣るの手伝って欲しいん！！
それなんに先生がずっと寝てたと思えばリモコン取るのすら頑張らないんじゃやる気出ないと思うん
それなん！
それにいざとなったら...
それにウチの学校 小中同じ教室っていうのもあんまり聞かないし...
それは...... 見てればわかるのん！！
それはどういう......
それは猫の手でしょー！！
それよりこまちゃん... 目いくつくらい描いて欲しいん？
それより聞いてほしいん！ このみ姉すごいん！！
それウチつくったん！ ダンボールでつくったん！
それ先言うん！！ なんて書いてるのーん！！
それ木なのん... なっつんそんなに困ってるのん...？
それ聞いたことあるん！ 2年生でやるやつなん！！
そろそろおやつの時間だからこまちゃんとこ来たん
そんなことよりそーめん食べたいのーん
そんなことよりウチ飴欲しいん
そんなことよりコンクールの話してたらお腹へったん
そんなときはこれ
そんなに見たいん？
そんなのしたら妖怪なん
そんなノリノリじゃなくていいんよ？
そんな急に言われてもウチ浮かばないんなー
そんな格好で写真撮っても意味ないのん
そんな浮かれ気分じゃ敵がでてきたときどうするん？
そーかー...... ここ田舎じゃないのねー......
そーしてまっとめって
そーだそーだそーだぞぅ
たかい！！
ただいまなのーん
ただいまなのーん！！
ただのお間抜けウサギと思ったら最初からこのつもりだったとは...
だから今日皆と花火できて 楽... し... かっ......
だから言ってたん ちゃんとかわいく描いたのん
だがしやー
だって牛が......
ちゃんとお外いってお日様でるようにお願いしてくるのん！！ 晴れるようにお願いするのはてるてるぼうずのお仕事なん！！
ちゃんと一人で起きれてるのん？ うちはおとーさんとおかーさんに起こしてもらってるん
ちゃんと書かないと駄目なん ひか姉友達いないん？
ちょっと待ってなん
ちょっと待ってなん 今観察日記書くん
ちょっと！ ウサギ小屋にいくからってアゲアゲしないで下さいっ！
つっとことん つっとことん
つっとことんの とーんっ
つまみん つまみん
つるー
で そのまま空高く飛んでいったら教えてあげるん
で でも姉ねぇ そうじゃないん ここで寝られると迷惑になるん...
で なっつん何か浮かんだん？
できたん
できたん... でもウチの思ってたのと違うん
でなー そのあと皆でお団子たべるーん
でも また行きたいのん
でもちょっとだけなんな？
でもウチの家 狸住み着いてるから田舎のような......？
でもウチ昨日仕事してたとこ見てないん
でも同じ名前と知ったら食べる気もなくなったん...
でも大丈夫！ 最悪でも飼育当番の人が来てくれれば見つけてくれるのん！
でも紙のパーは石のグーを包むだけなのん
とほほ... もういたずらはこりごりなーん...
どうしたんなっつん？ なんでノリツッコミなん？
どうですか？ ウチのダンスはー
どこから登るん？
どこなん！？ 見逃さないん！！
どこに話術あったのん...
どちらかというと真ん中が一番の見所なのん！
どっちかというとキリギリス......
どれもなん
どんくらい高いのん！？
な なっつん！！ 何が釣れたのん！？
な なんなん？ 何で走ってるん！！
な 何をいってるのん それくらい一人でいくん
なかなかやりおる
なっつん こいつ飼えるん？
なっつん ご飯のあとにラーメンなんて食べたら怒られるん
なっつん せっかくかわいくなったん こっち来るのん
なっつん なっつん！ 巣の中に赤ちゃんいるん！！
なっつん ひか姉 最後に海見にいくん だから泣き止むのん
なっつん ひか姉ー
なっつん キリギリスも釣れるし色々知ってるんなー
なっつん ダンボールに色塗れたん
なっつん 今日のニュース見た？
なっつん 助け呼んできたん！
なっつん 線香花火どっちが長くもつか勝負するん
なっつん 草むらで何釣ってるのん
なっつん 貝いっぱいとれたん なっつんも早くお魚釣るん
なっつん... 何してるのん...
なっつんがまだ帰りたくないって泣きだしたん
なっつんが乙女...？ ど どういうことなん！？ そのココロはなんなのん！？
なっつんと同じ班なーん
なっつんなっつん
なっつんなっつん！！
なっつんなんで泣いてるのん
なっつんにつくってもらったん！
なっつんにーこまちゃんにーほたるん なっつんの兄にぃ 駄菓子屋にこのみ姉とほのかちんにも送るん
なっつんのおばちゃん ほたるんが大人っていってたん いい感じの煙たさだったんな？
なっつんの気持ち今こんな感じ？
なっつんの言ったとおりなん
なっつんは成績良かったん？
なっつんは線にそってのこぎりで切ってください！
なっつんは駄菓子屋って呼んでるん
なっつんやるなら早くやるん
なっつんスイカ食べよ
なっつんセミになんの恨みが...
なっつんノリノリなんな！！
なっつんーちゃんとやるんー
なっつんーん 遊びにきたのーん なっつーん
なっつん何とったん！？
なっつん何釣るん！？ ウチ「めでたい」の鯛とりたいん！
なっつん本当にいっぱい知ってるのん
なっつん頭いいのん
なっつん！ 花火までに今日の宿題終わらすん！！
なっつーん
なにがのん？
なるほど 全てわかったのん
なんかいるん！！
なんかおもしろそうなん！ やる気出てきたのん！！
なんかウチのカメラ魂に火がついたのん！
なんか変な穴あるのん
なんでさっきからウチを騙そうとするん...
なんですとー
なんでなっつんこんな乙女チックなん作れるん！？
なんでひか姉となっつんマンタ見なかったのん？
なんでもいいん！！ ウチちょうどケーキ食べたかったん！！
なんでわかったん！ さては妖怪の力なんな！！
なんで一人で笑ってるのん...
なんで？
なんとなくスッキリー
なーっ！！！
なーなー ウチ屋上のパンダのりたいん
なーるほどっ
なーーーっ！！？
な！ 豚汁もうできてたん！？
な！？
にしてもグレートマンおもしろかったのんなー？
にゃん ぱすぅ
にゃんぱすぱすーん
にゃんぱすんっ！！
にゃんぱすー
にょっにょっ
にょっにょっ にょっぱっぱ
にょっぱぱのぱー
にょぱ？
ぬおっしゃーい
ぬーりぬりーまっ黒にるーりぬりー あの日のこともぬーりぬりー♪
ね... 姉ねぇいつケーキなんて買ったん！？ ショートケーキなん！？ チョコレートなん！？
ね... 姉ねぇそれみかんのおっきいやつなん
ねぇねぇがいい匂いする消しゴムかじってたのと同じ原理なんな？
ねぇねぇが頼んだん
ねぇねぇに100円もらったのーん
ねぇねぇに入れてもらったん
ねぇねぇは何を言ってるのん！！
ねぇねぇは忙しいっていってたん
ねぇねぇスキーいくん！？
ねぇねぇティッシュー
ねぇねぇ外見てみるん！
ねぇねぇ大丈夫なん 歌うたって歩けば元気でるん
ねぇねぇ早く焼くん！！
ねぇねぇ朝ごはんまだなのんー？
ねぇねぇ起きるのん！
ねぇねぇ！！ それ おーとくちゅーる！？
ねぇねぇ！！ 今日カレーなのん！？
ねえねえ... 乗り遅れたん...
ねえねえお手紙！！お手紙！！
ねえねえは今日も寝てるのん
ねえねえは布団の中で”あと5分だけ”を1時間以上続けてたので放っておきました
ねえねえ問題集おわったー
ねえねえ問題集でけたー
ねじれてるから宇宙じゃないのん？
ねーっこじゃらしー ねっこじゃらしー♪
のすっ！！
はつひので...
はー...
ひ 飛行機！！？
ひかねぇ なんて言ってたのん？
ひかねえひかねえ 都会どんなだったのん？
ひか姉 お金なくて帰れないって言ってるん
ひか姉だめだめなのん... 付き合い悪いのんなー
ひか姉なのん
ひか姉は沖縄行きたくないん？
ひか姉悪役みたいな感じなん
ひか姉明けましたん！
ひか姉東京なん 呼べるん？
ひこうきーー！！
ひこーきどれくらい高く飛ぶのん！？
ひらたいらさんいっぱいなん！
ひらたいらさんっていうん
ひらたいらさん動かないん
び... 病院！！ お医者さんを呼んでください！！
びしー！
びしー！！
ぴ... ち ぴ...
ぴち ぴ...
ぴちぴちー
ぴっちぴちー
ふぁんしーってなんなのん？
ぶっうぉうぉーん
ぶっうぉうぉーん！！
ぶーん
ほ ほたるんがいっぱいなのん！！
ほ... 本当に妖怪なのん！？ もしそうなら証拠見せてほしんん！！
ほう
ほたるん 東京いたときとかは山持ってなかったん？
ほたるん...... まだ勝ったつもりになるのは早いん
ほたるんが夜の廊下を1人で走ってるーん！！
ほたるんとやろうと思って二つ持ってきてたん
ほたるんはにゃんこなのん！
ほたるんは何も悪くないのん
ほたるんもっと近くに見に行くのん！！
ほたるんも家のお手伝いしてたおかげなん？
ほたるん大きいからいっぱいよそったのん
ほたるん新幹線乗ったことあるのん？
ほたるん来たーん
ほたるん雪的なもの好きなんなー
ほのかちん 今いくつなのん？
ほのかちんとこ遊びに行ってくるん！
ほのかちんと遊びに来たのん
ほのかちーん 遊びに来たのーん
ほら鶏の卵だってあるのん
まかせといてくださいん！
まさかなっつんまで消しゴムを！！？
まさか本当に... 本当にこのみ姉は妖怪「医者いらず」だったん...？
まずお皿に穴を開けて... そのあと穴にそってペンで線をひくのん
まずその板を土台にしてでかい板を立てるようにするん！
まずウチがお手本見せますのーん
まずウチが目印の線をひきますっ！！
また2学期に
またウチの知らないことばっか！
またー
また明日なのん！
まだまっすぐなーん
まだ考え中なのん
まだ飲んでないのん
み... 水...
みょーみゃがしやいったのん
みーはなんなん？
むむあ〜
めで＋かい＝目でかい
めで＋たい＝めでたい
めで＋わからない（なし）＝めで＊助け
めーでー...... メーデーってことなんな！
もう9時なのにまだ起きてていいん！？
もういっぱい寝たん ウチも初日の出見に行くん
もうそれ終わったん！
もう夏休み半分経ってるのん
もう歩いて行った方が早いのん！！ 駄菓子屋呼ぶん！！
もしかして なっつん... ウチが本当に何も思いついてないと思ってるん？
もしかしてウチ...... 田舎にすんでるのん？
もしくは！ 歩く生き字引と呼んでくれたら嬉しいですん！
もっとかけ算するーん！
もっとまっすぐなん
もっとよもぎとるーん
もっと光をーらいちんぐをー
もっと右なのん！！
もっと猫背なおしてー あと学校いくときスーツ着るといいと思うん でそれからー
もっと真ん中なん！
もりもり食べてもりもりして下さいっ
もーち もちもち
や やはりこれは呪文書...！？ このみ姉こんなものにまで手をだして...
やったのん やったのーん！！ 姉ねぇ次の敵！次の敵なのーん！
やっぱりここって田舎なのん？
やっぱりこのみ姉 妖怪のテスト合格しただけあって 教えるのもすごくうまいんなー
やっぱりなんなー
やっぱり姉ねぇには無理だったん こうなったらウチが皆のやる気出させるん！！
やっぱ都会すごいのんな〜
やっぶからぼーにすったこらさー やっぶれたラブレター持ってすったこらさ〜
やりましたん！！
やーぶっれかっぶれのヤブ医者が〜 タケやぶの中へすったこらさ〜
よかったのんなー 皆あたったん
よくわからないけど なっつんドンマイなのん
よく見てみるん この定規の置き方に何か気付かないのん？
よもぎいっぱいとれたんー
よもぎも罪な奴なん...
より鬼になりきった方の勝ちなのん！！
らっしゃいん！！
るったん るったたん♪
わ わかったのん！！
わいわい
わかったのん
わかったのん！ お魚の背中の実をとるんな！
わかったのん！！
わかったのーん
わかったのーん！
わかったん 2時なんなー
わかったん！ お祭り... お祭りなんなー！！？ ウチも祭るーん！！
わかったん！ みてるん！！
わかってるのんー
わかってるのーん 燕返しするーん
ん ありがとなのん
ん 皆でいくのん
ん〜 そうなん 教え方じゃなくて見た目しゃきっとするのはどうなん？
んあー ウチはなー
んあー...
んう...？
んう？
んなっ！！？
んぬん？
んもー わかったのん 明日からはちゃんとするのんなー
んー
んー... やっぱりウチやほたるんみたいに人じゃないとモノマネって言いにくいのん......
んー... 仕方ないのんなぁ
んーん
アテあるーんっ！？
アラ
アラ本当
ウ ウチも！！ ウチもサンタさんみたいな立派な妖怪になりますか！！
ウォー
ウサギに人参いっぱい食わせるどころか ウサギに一杯食わされてしまいました
ウサギ小屋にいくと思ったらついテンションあげあげしちゃいましたー
ウサギ普通に捕まえようとしても時間かかるだけなのん
ウチ お雑煮食べたいん！！
ウチ そういった尖ったこと考えるの大好きなん
ウチ どんまいんッ！！
ウチ ねえねえに道草食うなって言われてるのん...
ウチ れんげっていうのん
ウチ セミの幼虫見たの初めてなのんっ
ウチ ソリのがいいん サンタさんみたいなん
ウチ タマネギ釣りたかったん
ウチ デパートの風になるん
ウチ 今カメラマンなのんー
ウチ 今顔描いてるん
ウチ 口止めされてるん その件に関しては言えないん
ウチ 宿題あと自由研究だけだからセミの脱皮観察するん
ウチ 打ち上げ花火見たいん！！
ウチ 機械にはうといのん
ウチ 窓の方座っていいん？
ウチ 粘土で遊ぶん...
ウチ 色んな場所知ってるのん
ウチ 里帰りしたことないん
ウチ... 知ってるん......
ウチ...... 兄にぃに勝つためになっつんに全てを託して賭けに出るん
ウチお菓子見るん
ウチがモノマネのお手本するん？
ウチが作った新鬼ごっこ... ルールは簡単！
ウチが描きたかったのはこんなのじゃないん...
ウチが言う順番で釘で固定してください！！
ウチそれやりたいーん
ウチそんなんじゃダメだと思うん
ウチだけじゃないん こまちゃんもやるん
ウチだけ椅子ー
ウチちりとりやるーん
ウチとしたことが... スコップの誘惑に負けるとこだったん...
ウチと一緒なのん
ウチと一緒なん！！
ウチならいっぱい目つけてあげられるんにー...
ウチなんでもいいーん
ウチなー？ 今文化祭に出す工作作ってるん！ 喫茶店も手伝うのん！
ウチの鬼ごっこは部屋でもできるん
ウチはお遊戯するん
ウチはしゅのーけるなーん！
ウチはトビウオさーん！！
ウチは怖がらせないよう優しく声かけてみるのん
ウチは騙されないのん
ウチも カメラありがとなのん
ウチもあやとりするーん
ウチもいくーん！！
ウチもう問題集できたー
ウチもお手紙書くーん！
ウチもこういう一人遊び得意なのん
ウチもっ うちもタマネギ釣りたいん！！
ウチもっ 行くんっ 初日の出っ
ウチもっと安いと思ってたん...
ウチもなっつんの家でやったから説明するのん
ウチもよくわからないん 大体ここらへんの山全部なん
ウチもオリジナルあやとりできたー
ウチもーウチも遊ぶん！
ウチも初日の出行きたいん 言うことならちゃんと聞くん 嫌いなものもちゃんと食べるん
ウチも帰るーん
ウチも置いとくーん
ウチも見えてたん
ウチも見るん
ウチも！！ ウチも花火したいん！！
ウチら...... 結構長い付き合いでしたよねえ？
ウチ今算数やってるん ＝の前も後ろも数字がくるん
ウチ年賀状描くーん
ウチ手伝うーん
ウチ駄菓子屋いきたいーん
ウチ！ ウチ懐中電灯持つん！！
ウーサギ小屋ー
ウーチもじゃれつくねこ......
カキカキー
カニー
カプセル黒くて中身見えないのが証拠なのん！！
ガシーン
キリンさんなーん
グレートマンはじまるん
グレートマンパンチー
グレートマン！グレートマンなのん！
グーは痛くもかゆくもないんなー？
ゲームなん？
コンクールとかよくわかんないのん
ゴロゴロー おジュースいりませんかー？ ピーマン汁〜こまつな汁〜ほうれん草汁〜
サンドウィッチん！！
サンドウィッチーん！
ザ・もろこし釣りー
ジュースー
スイカ持ってきたん
スコー
セ... セミぃ...
セイ！
セミは短くとも大空にはばたき甘い蜜をすえるけども...
セミ！？ 虫取り網ないのにっ！？
ソリるーん
タ... タマネギって釣れるのん！？
タマネギ... タマネギ！？
タマネギで釣れるのん？
ダイナマイッ
ダメなのん？
ダメなん 家にいるかどうかは言わない約束したん ウチは約束守る主義なん
ティッシュ！！ あたったーん！！
テンパではございませんっ！！
デコポン！！
デパート来たーん！！
ハイ... テク...ッ
ハッ でも貝取れば「目がでかい」って意味になるんな？
ハンコッ！ ハンコーッ！！
バイクぶるんぶるんしないのん？
バケツにも入らないかもっていってたん！ 入れ物もってかないとダメなん！
バックオーライ
パンかじってくん
パンダのったん！
ファンキーなのーん？
フスー
フッフヌフーン〜♪
フヌー
フフフ...
フーム
ホント 笑わせてくれる...
ポーズも可愛い感じにするのーん
マンタすごかったんなー
ミカン見てたらお腹減ってきたのん
ムウ... つまんないんな〜
ムササビも木の実好きなんなー
ムムム...
ラクチンなんー
ラーメンおいしーーん！！
ルアーって作り物なんな？ なんで作り物を食べに来るん？
レインコートにマジックついちゃったん
レインコートー
一体パーは何がしたかったのん...
三日くらいなら大丈夫 幸いエサに持ってきた野菜もあるのん
不良なのに真面目なのん
中学生は大変なんな〜？
中当て... 中当てが熱いと思いますがっ
人生みたいに？
今から指笛ふくのん！
今そっちもってくん！
今の言葉で発想浮かんだん！！ みかんとかどうなん！？
今度こそ... 今度こそお祭りなんなー！！
今度こそこまちゃんこえたのーん
今度こそ騙されたんなー
今度は走らないん
今度グレートマンごっこするのんなー
今日の姉ねぇいつもより寝てるん！！ しっかりしてほしいっていってるんにー！
今日は週末......
今行くーん
仏壇のとこまで全部きこえてたん
仕方ないのんなぁ... 今回はウチの負けでいいん ホントこまちゃんは小学生相手にも本気なんなー？
他の所も案内するん！！
他の見どころは......
休むんじゃーい
何いってるん？ 皆で見たら面白いのん お団子もあるん
何か音がしたのん... 具なのん？
何がにょぱにょぱ言ってたと思ってたーん？
何事も経験なのん！
何回も起こしたのに全然起きなかったのん...
何言ってるん... こんなの芸術性のカケラもないん
何言ってるんほたるん あんなに見事なオニのモノマネしてたんに
何言ってるん！ 大丈夫ですんだらお医者さんはいらない...
何言ってるん！！ 早く来るのん！！
先生は皆のやる気出させるのが仕事だと思うん
先越されたん！！
具
具じゃなかったん こまちゃんだったんなー
写真撮るならウチ 案内するのん
冷えてるん？
出来たん
初めて写真撮ったん！
初耳ですが！？
別にダメではないん
別のにするん...
前に ねえねえが車で時速50キロ走れば1時間後にちょうど50キロ先に着くから凄いなぁっていってたし......
勉強すればなれるん！？
動物の喫茶店なん
双眼鏡で覗こうとしても駄目なん ウチはひか姉のことならお見通しなのん
反撃なのーん
同じ名前と思うとかわいくみえるんなー
名前もつけましたけど
嘘と思うならやってみればいいん 一回も出たことないのん
土日はさんでの月曜... 三日後...
基本固形になっておりますが？
変なの描いたことないん 普通の絵なのん
変わってらっしゃる
外から鍵かかっちゃったのん
夜仕事してたん？
大丈夫なん お雑煮食べるーん
大丈夫なん ほたるん
大丈夫なん！！ このまえ稲刈りしたばっかだからいっぱいあるん
大漁なんなー
天ぷらもいいし お餅に入れるのもいいんし... よもぎパンもよもぎ茶もいいんなー 何にすればいいか悩ましいん......
天井の電気に虫跳んでるのん
失礼なん！ ちゃんと笑ってるかわいい辰描いたん
妖怪なら脱皮するのもいるかもしれないん！ でもこのみ姉妖怪じゃないから脱皮しないんなー？
姉々より先生にむいてるかもしれないん
姉々！ これどうなん！？
姉ねぇ こまちゃん達家に来るん
姉ねぇ そこにスリッパあるから履くのん
姉ねぇ 姉ねぇ！ これちょっとおかしいん ウチ魔物と戦いたいん なんで果物と戦ってるん
姉ねぇ 起きるーん
姉ねぇなんでそれでゲームにしようっていったん
姉ねぇはそのまま回ってほしいん
姉ねぇー 聞いてるん？
宇宙でしたー
完成したら見せるからそれまで待つのん
家どこにあるのん？
寝ないでください！！ 困りますん！！
寝室に布団あるから寝てきたほうがいいん
小屋に入った瞬間戸を閉めてくださいっ
小躍りじゃないん 大踊りなん
山つくって川もつくるのーん
山なのん！
帰ってくるん？
帰り道逆なのに大丈夫なん？
年賀状なん
年賀状に辰の絵描いてたん
引っ越しの時新幹線乗らなかったのん？
後ろの姉々ちゃんと着いてきてるん？
心配しなくても大丈夫なのん 年賀状はもっとかわいい辰の絵にするん
思い出したん 「苦悩」のことなんなー
思い出したん！！ ウチ出かけるときばんそうこ いつも持って出かけるん！！
怪人役でもいいのーん
我ながらいい出来なん
手が喋ってるん... こんな妖怪がいたとは...
手袋だったんなー ウチこのみ姉が脱皮したかと思っちゃったん
打ち上げじゃなかったらシャワーみたいなんでもいいのん！！
持ってますん
指とれてもすぐなおったん！！ 妖怪医者いらずなのん！！
掛け算ってどうやるん？
撮るん！撮るん！
日記ー 日記ー にっきっきー
早くしないとお日様出ちゃうん
明けましたん？
明けましておめでとうございますっ
明日はウチの家であそぶん
時間切れなのーん こーたーえーはー...
普通なんかでいいのん...？
普通にやったらおもしろくないん
普通消しゴムなんてかじらないんなー？ なっつんしたことあるん？
木登りうまいんなー
本当なん！！
本当に見ないんな？
来るまでウチがんばるのん！ー
来年何年なん？
来年来るん！？
次は一等賞とるのーん！
次ページのたたみかけがー
次学校はじまったら捕まえるん
歌うたったら元気でるってのもしかして嘘だったん......
歌ですん
残りのエサは小屋にもってくーん
毎日お風呂掃除手伝ってたおかげなん
水責め......
氷いれてもダメなのん？
氷と塩いれたら凍るん
沖縄 海ものすごく青いのんに？
沖縄に出発なーん！！
沖縄楽しみなんなー
泥舟なーん！ 泥舟禁止なーん！
海 真っ青なん！！
海！！ ウチも海いくん！！
燕返しはこうやって 一部分が机から飛び出したとき...... ペンにのせて移動させて押さえ込みに持っていく技なん
玉手箱半開きにしちゃったん？
申し訳ないのん ウチがウサギをエサで釣るとかって作戦たてなければ...
皆いい成績取ろうと頑張ってるのん
皆ろうかでねてるん？
真っ暗なんなー ウチこんな暗い山来たの初めてなん
知らない人がいるん！ 初めましてん！！
知らない子なのん...
石！！
砂も山もない...
空明るくなってきたん！！ お日様出るん！？
窓のとこのTVで見ていいん？
窓の外から聞こえたん！！
窓の外に目が光る八本足の火星人が寝転んでるーん！！！
紅葉もいいん... でも今日はウチ達木の実とりという冒険しに来たんじゃないのん？
終始 司会者席後ろの窓の外で ラジオ体操してるおじさんがいたのん
結局姉ねぇやる気ないんなー
結局無責任なんなー？
絵はほたるん来るまで休憩なのん
絵は描き終わるまで絶対見せないーん！！
綺麗に毛づくろいいったしましょー
羽織ー
考えるーん
腕時計出ると思わせて変なのでるん
花火できなかったけど花火できたんなー
花火ものすごく楽しみにしてたん！！ 聞いた時からワクワクだったのん！
菓子なん？ それウチ食べていいん？
落とされても地面につく前にペンではじき返して机に戻したらセーフになる技なん
葉っぱのお皿に皆の分けたん
葉書よりふーとーのがかっこいいのーん
虫取り網ないのに何取るん？
蛇なのに猫みたいな呼び方なんなー ウチ笑っちゃうん
行くーん
見たらまた「そすんす」するん
見ちゃダメなん
見つかんないのん...
見に行くん！
見るん見るん！！
見直しましたっ！！
触覚じゃないのーん わかってないのんなー？
言ってやって欲しいのん
設計図なん？ 書くん書くん！
誰もいないん...
貝とるーん
貝殻どうぞなん
貝殻なのん！ いっぱい拾ったから皆にもあげるん！
足いっぱいある火星人がでてきたん
足したら掛け算できちゃったん！！
足せばいいのん？
逃っげるーん！
週末はウサギ小屋にいくのがウチの趣味です
遊びに来たのん
遊ぶーん！！
遊べるん
遠慮しなくてもいいのん
遠慮しなくてもいいん... いっぱいつけてあげるのん！！
重いん
釣りしてたら大きいの釣れたん！！ なっつんがヌシ釣れたって言ってたん！！！
鉛入りソード... 鉛筆なんな！！
隣の部屋でゆっくり飛行機の話するのん！！
音が鳴らなくても具が来るっていう特技だったのん
頼りがいがある先生ならやる気も出るん
飛ぶん？ 飛ぶん？
飛行機！！ 飛行機！！
食べてくるーん！！
食べるん
食べるん！！
飴を発見しました！ 新作のミルクコーラ味ー！
飼うーん
駄目なん！ そんなんじゃそすんさーに聞こえないん！ もっと大きな声でそすんさーを呼ぶん！
駄目なん！ 描いてる途中の絵は見せないん！
駄菓子屋 文化祭来れないん？
駄菓子屋 駄菓子屋ー ウチ絵本よんでほしん
駄菓子屋とこのみ姉がお米で ごへーもち作ってくれるってー
駄菓子屋も初日の出行くん？
駄菓子屋ウチ五平餅たべたいん
駄菓子屋ー
駄菓子屋ー これいくらなのん？
駄菓子屋ー！ これっ これ乗れるん！？
駄菓子屋ー！ ねぇねぇー！ちょうどいいとこにいたーん！
駄菓子屋寝てるん？
駄菓子屋見てみるん！！ すごいん！ 海青いん！！
駄菓子屋！ ウチ何の格好だと思うん！？
駄菓子屋！ 何がでたん！？
駄菓子屋！ 飛行機どこなん！？
駄菓子屋！ 魚いたん！！
駄菓子屋！！ ティッシュあたったん！！
騙されたんなー なっつーん
高い！！
高校でびゅー失敗したんな？
鯛いないんなー うち取りたかったんにー
黒板消しはついでなのね......
！ じゃあ駄菓子屋はグレートマン行き着けのバーのママ役させてあげるん！
！ 駄菓子屋来るん！？
！！ じゃあウチひか姉に電話するん！
！！ ケーキ！？
！！ 駄菓子屋来ないんな...？
！！？
！？ あの長いやつ！？
！？ おーとくちゅーるってなんなのん！！？
！？ この格好かわいいん！？
！？ 何か出てきたのん！！
！？ 当然ですがっ！？
！？ 騙されたん！
？ あたり前なん 年賀状には絵描くん
？ こまちゃんを濃縮して まるっと丸めて裏から見た感じの絵なん
？ こんなとこに鍵おちてるーん
？ なっつん何作ったん？
？ なんで急に呼び捨てなん この一瞬でウチとなっつんの間に何があったん
？ なんなのーん
？ ねえねえいるのん
？ ウチそんなの描いたん？
？ セミは空とんでるん... こんなとこにいないのん
？ 何で片付けたのに水槽あるん
？ 普通なん ただ山持ってるだけなん
？ 返事がないのん
？？ どなたですのん...？
ｽﾞﾙﾙｯ
ﾁｭｰ
ﾋﾟｮｯ!! ﾋﾟｮｯ!!
ﾋﾟｮｯ!! ﾋﾟｮｯ!! ﾋﾟｭﾘﾗﾝｯ!!
ﾋﾟｮｰｯ!!
ﾋﾟｮﾙﾝｯ ﾙﾙｯ!!
ﾋﾟｯ!! ﾋﾟｮｯ!!
ﾌｯﾌｯﾌｰﾝ
ﾌｰﾝ...
ﾌｽｰ
ﾑﾝｯ
      EOL
      dict.split("\n").sample
    end
  end
end
