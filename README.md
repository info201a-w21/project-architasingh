# Final Project
Use this `REAMDE.md` file to describe your final project (as detailed on Canvas).

## Domain of Interest

* Why are you interested in this field/domain?
  + Archita: I’m interested in learning more about Bitcoin because I’ve heard bits and pieces about its surge and fall in popularity but still know very little about what Bitcoin is exactly and how it works. I’m also curious to learn more about what factors led people to turn to cryptocurrency over standard currency. Moreover, I’d like to better understand when and why Bitcoin became popular.
  + Enoch: When I think of differences between my parents’ generation and mine, I immediately think of the technological innovations that have occurred. These notable innovations include the numerous transactions that can now be done online: we can buy stocks online through apps like Robinhood and invest in cryptocurrencies such as Bitcoin. I want to learn about Bitcoin because I have yet to understand the assets that it provides. 
  + Tyrell: As the first decentralized cryptocurrency, bitcoin has grown immensely popular recently. If Bitcoin fulfills its potential  (transferring currency via the net with no fees, the same value in any country,  no account freezes, no arbitrary limits, etc) this could end up being our future world-wide used currency. With this in mind, I am hoping to use data to discover why bitcoin is increasing in value and popularity, uncover the risks, and possibly educate myself to understand how to use Bitcoin in the near future. 

* What other examples of data driven project have you found related to this domain (share at least 3)?
  + https://towardsdatascience.com/tagged/bitcoin - This project focuses on predicting Bitcoin pricing
  + https://qdm12.github.io/BitcoinUses/results/ - This project focuses on Bitcoin usage since 2009. It seems to have been created for a project. 
  + https://data.world/gabrielamiecz/bitcoin - Similar to the interest of our group, this data-driven project‘s goal was to find the main reason for the growing popularity of  Bitcoin. 

* What data-driven questions do you hope to answer about this domain (share at least 3)?
  + When was Bitcoin usage at its peak?
  + How has Bitcoin’s value fluctuated?
  + What is the total amount of circulating Bitcoin?
  + How many Bitcoin transactions occur daily?
  + How many Bitcoin/Blockchain wallets have been created?

## Finding Data

**Source 1:**

* Where did you download the data (e.g., a web URL)?
  + https://www.blockchain.com/charts/total-bitcoins 

* How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
  + This data was collected by blockchain.com. This data depicts the total number of Bitcoin circulating the network on a configurable time scale. This is calculated from the theoretical reward defined by the Bitcoin protocol. 

* How many observations (rows) are in your data?
  + There are a variety of observations (rows)  ranging from  ~5 million to ~19million.

* How many features (columns) are in the data?
  + The features (columns) are displayed as a configurable time scale.  From a daily to all time, this data set shows a variety of features.

* What questions (from above) can be answered using the data in this dataset?
  + Depending on the point of time, the question “What is the total amount of circulating Bitcoin?” can be answered using this data set.

**Source 2:**

* Where did you download the data (e.g., a web URL)?
  + https://www.kaggle.com/mczielinski/bitcoin-historical-data

* How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
  + The dataset was put together by the user Zielak on Kaggle, who apparently compiled all of the data from bitcoincharts.com. The data essentially shows the fluctuations of the value of bitcoin by the minute, from 2012-01-01 to 2020-12-31.

* How many observations (rows) are in your data?
  + There are 4,727,777 rows.

* How many features (columns) are in the data?
  + There are eight columns.

* What questions (from above) can be answered using the data in this dataset?
  + This data set can answer questions concerning the min, max, and closing values of bitcoin during a certain time frame. It can also provide information on the volume-weighted average price. While there is a column about the volume of BTC transacted in a window, there seems to be very little actual data within these cells (a lot of cells are NaN). 

**Source 3:**

* Where did you download the data (e.g., a web URL)?
  + https://www.kaggle.com/bigquery/bitcoin-blockchain 

* How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
  + The data set was put together by Allen Day, Google Cloud Developer Advocate, and Colin Bookman, Google Cloud Customer Engineer. They collected the data from the Bitcoin network using a GitHub client. Within the overall data set, there are 4 data sets called blocks, inputs, outputs, and transactions. I’m focusing on the transactions data set for the following questions.

* How many observations (rows) are in your data?
  + There are 466m rows.

* How many features (columns) are in the data?
  + There are 17 columns.

* What questions (from above) can be answered using the data in this dataset?
  + How many Bitcoin transactions occur daily?