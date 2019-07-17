Coursea Data Science Capstone Project
========================================================
author: Saurabh Yadav
date: 3 November 2018
autosize: true

About the project or product
========================================================

- The Final Capstone project of coursera data science (JHU) is to create a predictive algorithm to predict the next word based on the previous typed words.

- This product works using the n-gram model.

- This product works on 2-gram and 3-gram to give the prediction for the next word with atleast decent accurecy.




How the predictive model works
========================================================
- In the app you type a word and a sentence and it gives you the next predicted word that you would like to use.

- In this product the use models are 2-gram,3-gram.

- First, the senteces from the corpus are used to create the n-grams and then those n-grams are coerced into table to count the frequency of each uniqe n-gram and the tables are coerced into a data frame.

- for singal word it uses the 2- gram and the for more than one word it uses 3-gram model.

- So when you type a word the the model takes the last one,two or three words and search into the dataframe for the highest frequancy word starting with those one,two or three words

- And then it gives you the final predicted word having the highest after those typed words. 




Summarizing the performance of the predictive model
========================================================
- For the long sentences the model uses the 4-gram model.

- The accuracy and speed is good when the model uses 2-gram or 3-gram


- Though, it gives a decent accuracy but somewhere the model loses the speed of the performance when it uses the 4-gram model.

- But on average time taken by 3-gram is (user:1.11, system:0.03, elapsed: 1.14).


Links for the product
======================================================

- The next word predicter is hosted on the shinyapp.io

- The link for the product is <https://saurabh-24.shinyapps.io/DataScienceCapstonecompleted/>


