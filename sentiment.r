library('syuzhet') #for sentiments analysis
library("ggplot2")

setwd('/home/long/TTU-SOURCES/gan-learning')

files = c("reddit_amber_leaves.csv")
f = "reddit_amber_leaves.csv"
for(f in files) {
  comment_data = read.csv(f, sep='|', header = FALSE)
  colnames(comment_data) = c('username', 'comment')
  
  file_result = df <- data.frame(anger=integer(),
                                 anticipation=integer(),
                                 disgust=integer(),
                                 fear=integer(),
                                 joy=integer(),
                                 sadness=integer(),
                                 surprise=integer(),
                                 trust=integer(),
                                 negative=integer(),
                                 positive=integer()
                                
                                 )
  
  
  for(comment in comment_data$comment) {
    emotion_data = get_nrc_sentiment(comment)
    max_emo = max(emotion_data)
    
    if (max_emo == 0) {
      max_emo = 1
    }
    emotion_data = emotion_data / max_emo
    
    file_result = rbind(file_result, emotion_data)
  }
  
  write.csv(file_result, file = "output/" + sub(".csv", ".out.csv", f),  row.names=FALSE)
  
}



