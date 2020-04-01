# COVID-19: Twitter-Analysis
#### Twitter study, includes the Tweets between the day first COVID-19 case detected from Whuan on 31st Dec 2019, till 15th March 2020. We did twitter mining based on this dates for the study. 



<p align="center"><img width=86% src=https://user-images.githubusercontent.com/44467789/76741958-64ac7300-6796-11ea-8e6b-db2c0859357b.png> 
  
                                                    Source: PNGKey




<br>

## Table of Content

- [Objective](#objective)
- [Approach](#approach)
- [Study Dataset Creation](#study-dataset-creation)
- [Tweet Analysis](#tweet-analysis)
- [Results](#results)


<br>

## Objective

Objective of this study is to do an analysis on official twitter account from the top countries' health department and WHO twitter account on COVID-19 breakout since 31st Dec 2019 in Wuhan, China. We analyzed which countries' health departments are most active in this war against the pandemic.

<br>

## Approach
- Set Twitter API
- Use personal API and codes for tweet mining.
- Identify the countries official Health Department accunts on twitter
- Collect Tweets from 01/01/2020 to 15/03/2020
- Analysis on ReTweets and Active official accounts
- Analysis of frequently of words in tweets
- Combine data results and conclusion. 

<br>

## Study Dataset Creation

For the data, we turned to twitter API. Here, we targeted the important health department in countries and their official Twitter account. Twitter official accounts,

- World Health Organization: @WHO

- India: Ministry of Health: @MoHFW_INDIA

- The USA: TheU.S. Department of Health and Human Services: @HHSGov

- UK: Department ofHealth and Social Care: @DHSCgovuk

- Australia:Australian Government Department of Health: @healthgovau


For the analysis, we collected the tweets from the respectedoffice health accounts from 31st Dec 2019 till 15th March2020. 

```

## @WHO

tweetWHO1 = searchTwitter('from:@WHO', 2000, lang = 'en', since = '2020-01-01', until = '2020-03-15')

tweetWHO1 = do.call('rbind', lapply(tweetWHO1, as.data.frame))

View(tweetWHO1)
```

F0r Study purpose we focused only on ReTweets, however,

```
> head(tweetWHO1)
                                                                                                                                                                text
1                       During times of stress and crisis, it is common for children to seek more attachment and be more demanding on paren… https://t.co/ttY5e8BS8L
2                       We thank our 6 million followers for their trust and support to provide the world with accurate health information.… https://t.co/DGuhFme9Rq
3                     RT @Refugees: "What are we doing to help refugees avoid the #coronavirus?"\n“Will people fleeing war still be able to cross borders?” \n“Coul…
4                       RT @DrTedros: You do a heroic job. We know that this crisis is putting a huge burden on you and your families. We know you are stretched to…
5                       RT @DrTedros: I want to send a personal and sincere thank you to every health worker around the world – especially nurses and midwives, who…
6 RT @DrTedros: Appreciated the chance to talk with @MattHancock today about #COVID19 in the <U+0001F1EC><U+0001F1E7>. @WHO is committed to working with the govern…
  favorited favoriteCount replyToSN             created truncated
1     FALSE          1414       WHO 2020-03-14 23:26:27      TRUE
2     FALSE          4675      <NA> 2020-03-14 23:12:56      TRUE
3     FALSE             0      <NA> 2020-03-14 23:10:57     FALSE
4     FALSE             0      <NA> 2020-03-14 23:10:33     FALSE
5     FALSE             0      <NA> 2020-03-14 23:10:30     FALSE
6     FALSE             0      <NA> 2020-03-14 23:10:12     FALSE
           replyToSID                  id replyToUID
1 1238962852024717318 1238969771808432129   14499829
2                <NA> 1238966369477169153       <NA>
3                <NA> 1238965873932722176       <NA>
4                <NA> 1238965769611984897       <NA>
5                <NA> 1238965760455835658       <NA>
6                <NA> 1238965683158990848       <NA>
                                                                        statusSource
1 <a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>
2            <a href="https://mobile.twitter.com" rel="nofollow">Twitter Web App</a>
3 <a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>
4 <a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>
5 <a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>
6 <a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>
  screenName retweetCount isRetweet retweeted longitude latitude
1        WHO          831     FALSE     FALSE        NA       NA
2        WHO          960     FALSE     FALSE        NA       NA
3        WHO         1027      TRUE     FALSE        NA       NA
4        WHO          445      TRUE     FALSE        NA       NA
5        WHO          822      TRUE     FALSE        NA       NA
6        WHO          132      TRUE     FALSE        NA       NA
```

Similarly, we did for all the official twitter heal account from India, the US, UK and Australia. 

<br>

## Tweet Analysis

For analysis of tweets and we focused on retweets and favoritetweets. The understanding was to showcase how effective and actives their officialhealth departments twitter official accounts are. Did they helped used calm andare those official accounts sufficient to spread awareness. Let’s check. 

<br>

#### ReTweet ratio

The ratio defines, how many tweets reTweeted by @WHO – retweeted TRUE or FALSE. 

```
tweetWHO = tweetWHO1[, c("favoriteCount", "retweetCount", "isRetweet", 'screenName')]

# ReTweet Ratio - T/F

prop.table(table(tweetWHO$isRetweet))*100

Total_retweet_WHO = sum(tweetWHO$retweetCount)
```

Results indicats, only 37.4 retwetted by @WHO from the mentioned time frame.
And total number of ReTweets were :Total_retweet_WHO
[1] 320147

  FALSE     TRUE 
62.58503 37.41497

<br>

#### Favourite tweet:

Favourite tweet analysis, is for favourite tweets from @WHO. And what is the total count of Favourite tweets on @WHO tweets. 

```
favTweetsWHO = tweetWHO[which(tweetWHO$favoriteCount != 0),]

prop.table(table(favTweetsWHO$isRetweet))*100

Total_Fav_Retweet_WHO = sum(favTweetsWHO$retweetCount)

WHO = data.frame(Total_retweet_WHO, Total_Fav_Retweet_WHO)
head(WHO)
```
Total ReTweets: 320147 and Total Favourite tweets: 248133

<br>

#### Word frequency in text(tweet)

For the analysis we also created word cloud, and counts of word frequency in tweet from @WHO account. 

```
## Check the Most Frequently used Text


textWHO = dfm(tweetWHO1$text, remove = stopwords("english"), stem = TRUE, remove_punct = TRUE)

topfeatures(textWHO, 20)

textplot_wordcloud(textWHO, min_count = 10, max_words = 100, color = c('coral', 'seagreen'),
                   random_order = FALSE, rotation = 0.1)
```

Results,
```
> topfeatures(textWHO, 20)
    #covid19           rt     @drtedro          amp         case      countri 
         149          110          100           90           68           64 
   transmiss         @who         stop      prevent #coronavirus    communiti 
          61           40           39           36           35           34 
      spread        thank      respons          can       health      support 
          32           28           27           26           25           22 
       peopl     outbreak 
          21           19 
```

As, we can see #covid19 and @drtredro were among the highest used words in the tweets. 

<p align="center"><img width=86% src=https://user-images.githubusercontent.com/44467789/76827473-e2c75300-6844-11ea-8f78-d7015ce95ce5.png>
  
  
<br>

### NOTE: Similarly, we follow the same process to find results from respected official twitter accounts, 
<br>

#### From, India: Ministry of Health: @MoHFW_INDIA

<p align="center"><img width=86% src=https://user-images.githubusercontent.com/44467789/76827876-c7107c80-6845-11ea-83f4-bcb5bb31bd2d.png>

<br>

#### The USA: TheU.S. Department of Health and Human Services: @HHSGov

<p align="center"><img width=86% src=https://user-images.githubusercontent.com/44467789/76828007-050da080-6846-11ea-9e01-209fef955b25.png>
 
 <br>
 
#### UK: Department ofHealth and Social Care: @DHSCgovuk

<p align="center"><img width=86% src=https://user-images.githubusercontent.com/44467789/76828091-325a4e80-6846-11ea-97e0-219e97556972.png>
 
<br>

#### Australia:Australian Government Department of Health: @healthgovau

<p align="center"><img width=86% src=https://user-images.githubusercontent.com/44467789/76828283-9846d600-6846-11ea-824e-e7a72e6485a8.png>
  
<br>
                       
                       
# Results

As we can see the following data collected from the analysis, [R - code](https://github.com/RutvijBhutaiya/COVID-19-Twitter-Analysis/blob/master/Health%20Dept%20Countries.R)

```
> ORG_Tweet
                          [,1]
Total_retweet_WHO       320147
Total_Fav_Retweet_WHO   248133
Total_retweet_INDIA      86440
Total_Fav_Retweet_INDIA  37058
Total_retweet_AUS         1732
Total_Fav_Retweet_AUS      864
Total_retweet_USA        27603
Total_Fav_Retweet_USA     3135
Total_retweet_UK         67447
Total_Fav_Retweet_UK     36219
```

<p align="center"><img width=86% src=https://user-images.githubusercontent.com/44467789/76830156-aac30e80-684a-11ea-9336-5a4724db2c5f.png>

As we can see in the chart, WHO is leading with respect to their activeness on social medial platform Twitter. Here, we also interestingly see that the Australian health department is lagging far behind. 
                       
                   
