
## How Frequently users used Health Dept in tweets.. 

## Tweet Data Mining From Countries Health Department - Importance of That Dept

# Set API...


library(plyr)
library(twitteR)
library(stringr)
library(dplyr)

library(quanteda)


  
## Chek Countries Health Department and their Tweets analysis. 

## Considered Tweets When COVID 19 declared Pandamic on - 2020-03-11
  




## @WHO

tweetWHO1 = searchTwitter('from:@WHO', 2000, lang = 'en', since = '2020-01-01', until = '2020-03-15')

tweetWHO1 = do.call('rbind', lapply(tweetWHO1, as.data.frame))

View(tweetWHO1)


#write.csv(tweetWHO1, 'WHO Tweets.csv')

tweetWHO1 = read.csv('WHO Tweets.csv')
View(tweetWHO1)


tweetWHO = tweetWHO1[, c("favoriteCount", "retweetCount", "isRetweet", 'screenName')]


# ReTweet Ratio - T/F

prop.table(table(tweetWHO$isRetweet))*100

Total_retweet_WHO = sum(tweetWHO$retweetCount)



# Favourite Tweet

favTweetsWHO = tweetWHO[which(tweetWHO$favoriteCount != 0),]

prop.table(table(favTweetsWHO$isRetweet))*100

Total_Fav_Retweet_WHO = sum(favTweetsWHO$retweetCount)

WHO = data.frame(Total_retweet_WHO, Total_Fav_Retweet_WHO)
head(WHO)




## Check the Most Frequently used Text


textWHO = dfm(tweetWHO1$text, remove = stopwords("english"), stem = TRUE, remove_punct = TRUE)

topfeatures(textWHO, 20)

textplot_wordcloud(textWHO, min_count = 5, max_words = 200, color = c('coral', 'seagreen'),
                   random_order = FALSE, rotation = 0.1)





#*************************************************************************************************************************

# @INDIA 


## @MoHFW_INDIA - Ministry Of Health - India

tweetINDIA1 = searchTwitter('from:@MoHFW_INDIA', 2000, lang = 'en', since = '2020-01-01', until = '2020-03-15')

tweetINDIA1 = do.call('rbind', lapply(tweetINDIA1, as.data.frame))

View(tweetINDIA1)


#write.csv(tweetINDIA1, 'INDIA Tweets.csv')

#tweetINDIA1 = read.csv('INDIA Tweets.csv')


tweetINDIA = tweetINDIA1[, c("favoriteCount", "retweetCount", "isRetweet", 'screenName')]


# Retweet Ratio : T/F

prop.table(table(tweetINDIA$isRetweet))*100

Total_retweet_INDIA = sum(tweetINDIA$retweetCount)


# Fav. Tweets

favTweetsINDIA = tweetINDIA[which(tweetINDIA$favoriteCount != 0),]

prop.table(table(favTweetsINDIA$isRetweet))*100

Total_Fav_Retweet_INDIA = sum(favTweetsINDIA$retweetCount)



INDIA = data.frame(Total_retweet_INDIA, Total_Fav_Retweet_INDIA)



## Check the Most Frequently used Text


textINDIA = dfm(tweetINDIA1$text, remove = stopwords("english"), stem = TRUE, remove_punct = TRUE)

topfeatures(textINDIA, 20)

textplot_wordcloud(textINDIA, min_count = 5, max_words = 200, color = c('coral', 'seagreen'),
                   random_order = FALSE, rotation = 0.1)



#************************************************************************************************************

# @USA


## U.S. Department of Health & Human Services (HHS) -  USA


tweetUSA1 = searchTwitter('from:@HHSGov', 2500, lang = 'en', since = '2020-01-01', until = '2020-03-15')

tweetUSA1 = do.call('rbind', lapply(tweetUSA1, as.data.frame))

View(tweetUSA1)


#write.csv(tweetUSA1, 'USA Tweets.csv')

#tweetUSA1 = read.csv('USA Tweets.csv')



tweetUSA = tweetUSA1[, c("favoriteCount", "retweetCount", "isRetweet", 'screenName')]


## ReTweet ratio

prop.table(table(tweetUSA$isRetweet))*100

Total_retweet_USA = sum(tweetUSA$retweetCount)


# Favourit Tweets

favTweetsUSA = tweetUSA[which(tweetUSA$favoriteCount != 0),]

prop.table(table(favTweetsUSA$isRetweet))*100

Total_Fav_Retweet_USA = sum(favTweetsUSA$retweetCount)

USA = data.frame(Total_retweet_USA, Total_Fav_Retweet_USA)



## Check the Most Frequently used Text


textUSA = dfm(tweetUSA1$text, remove = stopwords("english"), stem = TRUE, remove_punct = TRUE)

topfeatures(textUSA, 20)

textplot_wordcloud(textUSA, min_count = 5, max_words = 500, color = c('coral', 'seagreen'),
                   random_order = FALSE, rotation = 0.1)



#***************************************************************************************************************

# @UK

## @DHSCgovuk - Department of Health and Social Care - UK

tweetUK1 = searchTwitter('from:@DHSCgovuk', 2500, lang = 'en', since = '2020-01-01', until = '2020-03-15')

tweetUK1 = do.call('rbind', lapply(tweetUK1, as.data.frame))

View(tweetUK1)


#write.csv(tweetUK1, 'UK Tweets.csv')

#tweetUK1 = read.csv('UK Tweets.csv')



tweetUK = tweetUK1[, c("favoriteCount", "retweetCount", "isRetweet", 'screenName')]


# ReTweet Ratio

prop.table(table(tweetUK$isRetweet))*100

Total_retweet_UK = sum(tweetUK$retweetCount)

# Favourit Tweets

favTweetsUK = tweetUK[which(tweetUK$favoriteCount != 0),]

prop.table(table(favTweetsUK$isRetweet))*100

Total_Fav_Retweet_UK = sum(favTweetsUK$retweetCount)

UK = data.frame(Total_retweet_UK, Total_Fav_Retweet_UK)



## Check the Most Frequently used Text


textUK = dfm(tweetUK1$text, remove = stopwords("english"), stem = TRUE, remove_punct = TRUE)

topfeatures(textUK, 20)

textplot_wordcloud(textUK, min_count = 5, max_words = 200, color = c('coral', 'seagreen', 'orange'),
                   random_order = FALSE, rotation = 0.1)



#*************************************************************************************************************

# @AUSTRALIA

## @healthgovau - Australian Government Department of Health - Australia

tweetAUS1 = searchTwitter('from:@healthgovau', 2500, lang = 'en', since = '2020-01-01', until = '2020-03-15')

tweetAUS1 = do.call('rbind', lapply(tweetAUS1, as.data.frame))

View(tweetAUS1)


#write.csv(tweetAUS1, 'AUSTRALIA Tweets.csv')

#tweetAUS1 = read.csv('AUSTRALIA Tweets.csv')


tweetAUS = tweetAUS1[, c("favoriteCount", "retweetCount", "isRetweet", 'screenName')]


# ReTweet Ratios

prop.table(table(tweetAUS$isRetweet))*100

Total_retweet_AUS = sum(tweetAUS$retweetCount)


# Favourit Tweets

favTweetsAUS = tweetAUS[which(tweetAUS$favoriteCount != 0),]

prop.table(table(favTweetsAUS$isRetweet))*100

Total_Fav_Retweet_AUS = sum(favTweetsAUS$retweetCount)

AUSTRALIA = data.frame(Total_retweet_AUS, Total_Fav_Retweet_AUS)




## Check the Most Frequently used Text


textAUS = dfm(tweetAUS1$text, remove = stopwords("english"), stem = TRUE, remove_punct = TRUE)

topfeatures(textAUS, 20)

textplot_wordcloud(textAUS, min_count = 2, max_words = 100, color = c('orange','seagreen'),
                   random_order = FALSE, rotation = 0.1)



# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


ORG_Tweet = data.frame(WHO, INDIA, AUSTRALIA, USA, UK)

ORG_Tweet = t(ORG_Tweet)

write.csv(ORG_Tweet, 'ReTweet Data Health Dept Country.csv')
