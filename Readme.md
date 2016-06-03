对于小规模的Web应用中的全文检索需求, 使用PostgreSQL自身的全文检索功能即可实现。

但是对于中文或者日文这种需要额外进行分词处理的语言,PostgreSQL没有内置针对这些语言的分词处理功能,需要单独进行安装PostgreSQL的扩展。

Rails应用如果要使用PostgreSQL + pg_search的组合进行全文检索,需要提前配置好以下PostgreSQL的扩展。

简体中文: 推荐使用SCWS + zhparser, 参考文档: [PostgreSQL + SCWS + zhparser + Rails4 + pg_search 实现中文全文检索](http://www.racksam.com/2016/05/03/chinese-full-text-searching-with-postgresql-zhparser-and-rails/#more)
日文: 推荐使用mecab + textsearch_ja, 参考文档: TODO

