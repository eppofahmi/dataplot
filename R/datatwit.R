#' Twitter dataset
#'
#' A dataset containing general twitter data
#'
#' @format A data frame with 293 rows and 15 variables:
#' \describe{
#'   \item{full_text}{full text tweet}
#'   \item{full_text_norm}{cleaned full text}
#'   \item{entities_user_mentions}{user mentioned in body text}
#'   \item{in_reply_to_user_id_str}{replied user id}
#'   \item{favorite_count}{count number of pavorite per tweet/rows}
#'   \item{created_at}{date the tweet created}
#'   \item{reply_count}{number of reply of a tweet}
#'   \item{in_reply_to_screen_name}{replied screen name}
#'   \item{id_str}{user id of tweet creator}
#'   \item{entities_hashtags}{hashtag used on the tweet}
#'   \item{text_sentiment}{sentiment of the tweets}
#'   \item{retweet_count}{number of retweet}
#'   \item{user_name}{user name of tweet creator}
#'   \item{user_screen_name}{user screen name of tweet creator}
#'   \item{n_words}{number of word on cleaned text/column}
#' }
#' @source \url{http://www.kedata.online/}
"datatwit"
