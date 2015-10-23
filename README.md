# 844196_renge

[![Join the chat at https://gitter.im/844196/844196_renge](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/844196/844196_renge?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![](https://farm6.staticflickr.com/5687/22255465591_9b29b746f3_o.png)

<https://twitter.com/844196_renge>の中身

## Usage

```shellsession
$ bundle install --path vendor/bundle
$ cat <<EOF >.env
RUBOTY_NAME='844196_renge'
TWITTER_CONSUMER_KEY=''
TWITTER_CONSUMER_SECRET=''
TWITTER_ACCESS_TOKEN=''
TWITTER_ACCESS_TOKEN_SECRET=''
EOF

$ bundle exec ruby run.rb
```

## Functions

|Command|Pattern|Description|
|:-----:|-------|-----------|
|convert|/(en&#x7C;de)code\s(.+)\z/i|[N暗号](https://github.com/844196/n_cipher)のエンコード・デコード|
|talk|/talk(?:.*)\z/i|しゃべる|
|image2|/image( me)? (?&lt;keyword&gt;.+)/|画像検索(<https://github.com/r7kamura/ruboty-google_image>)
|oudon|/(?:お?うどん&#x7C;o?udon)\z/i|[@keep_off07](https://twitter.com/keep_off07)におうどん :ramen: をあげる|
