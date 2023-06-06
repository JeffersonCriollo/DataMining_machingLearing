{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "d5360c5d",
   "metadata": {
    "papermill": {
     "duration": 0.01367,
     "end_time": "2023-06-06T12:31:13.276489",
     "exception": false,
     "start_time": "2023-06-06T12:31:13.262819",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 1    Hands On: Data Import and Manipulation\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a9e6cb60",
   "metadata": {
    "papermill": {
     "duration": 0.011844,
     "end_time": "2023-06-06T12:31:13.300509",
     "exception": false,
     "start_time": "2023-06-06T12:31:13.288665",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## 2. Introduction to R for Machine Learning"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "5f42abde",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:13.329145Z",
     "iopub.status.busy": "2023-06-06T12:31:13.327011Z",
     "iopub.status.idle": "2023-06-06T12:31:14.414043Z",
     "shell.execute_reply": "2023-06-06T12:31:14.412257Z"
    },
    "papermill": {
     "duration": 1.103299,
     "end_time": "2023-06-06T12:31:14.416729",
     "exception": false,
     "start_time": "2023-06-06T12:31:13.313430",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.0     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.1.8\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'echocardiogram'</li><li>'networkcsv'</li><li>'new-york-air-quality'</li><li>'servicearea'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'echocardiogram'\n",
       "\\item 'networkcsv'\n",
       "\\item 'new-york-air-quality'\n",
       "\\item 'servicearea'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'echocardiogram'\n",
       "2. 'networkcsv'\n",
       "3. 'new-york-air-quality'\n",
       "4. 'servicearea'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"echocardiogram\"       \"networkcsv\"           \"new-york-air-quality\"\n",
       "[4] \"servicearea\"         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cfa65f0d",
   "metadata": {
    "papermill": {
     "duration": 0.011975,
     "end_time": "2023-06-06T12:31:14.441236",
     "exception": false,
     "start_time": "2023-06-06T12:31:14.429261",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(g) Create an array of 10 random integers between 1 and 100, and then calculate the mean and standard deviation of the array.**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "91f33aa4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:14.497476Z",
     "iopub.status.busy": "2023-06-06T12:31:14.467033Z",
     "iopub.status.idle": "2023-06-06T12:31:14.528234Z",
     "shell.execute_reply": "2023-06-06T12:31:14.526369Z"
    },
    "papermill": {
     "duration": 0.077534,
     "end_time": "2023-06-06T12:31:14.530860",
     "exception": false,
     "start_time": "2023-06-06T12:31:14.453326",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>12</li><li>15</li><li>16</li><li>18</li><li>15</li><li>45</li><li>15</li><li>49</li><li>66</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 12\n",
       "\\item 15\n",
       "\\item 16\n",
       "\\item 18\n",
       "\\item 15\n",
       "\\item 45\n",
       "\\item 15\n",
       "\\item 49\n",
       "\\item 66\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 12\n",
       "2. 15\n",
       "3. 16\n",
       "4. 18\n",
       "5. 15\n",
       "6. 45\n",
       "7. 15\n",
       "8. 49\n",
       "9. 66\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 12 15 16 18 15 45 15 49 66"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "27.8888888888889"
      ],
      "text/latex": [
       "27.8888888888889"
      ],
      "text/markdown": [
       "27.8888888888889"
      ],
      "text/plain": [
       "[1] 27.88889"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "19.9401883419167"
      ],
      "text/latex": [
       "19.9401883419167"
      ],
      "text/markdown": [
       "19.9401883419167"
      ],
      "text/plain": [
       "[1] 19.94019"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "b <- c(12,15,16,18,15,45,15,49,66)\n",
    "b <- array(b)\n",
    "b\n",
    "\n",
    "mean(b)\n",
    "sd(b)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "bf13d0b2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:14.559803Z",
     "iopub.status.busy": "2023-06-06T12:31:14.558395Z",
     "iopub.status.idle": "2023-06-06T12:31:14.597741Z",
     "shell.execute_reply": "2023-06-06T12:31:14.595887Z"
    },
    "papermill": {
     "duration": 0.056449,
     "end_time": "2023-06-06T12:31:14.600505",
     "exception": false,
     "start_time": "2023-06-06T12:31:14.544056",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>31</li><li>59</li><li>53</li><li>91</li><li>54</li><li>57</li><li>37</li><li>74</li><li>15</li><li>82</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 31\n",
       "\\item 59\n",
       "\\item 53\n",
       "\\item 91\n",
       "\\item 54\n",
       "\\item 57\n",
       "\\item 37\n",
       "\\item 74\n",
       "\\item 15\n",
       "\\item 82\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 31\n",
       "2. 59\n",
       "3. 53\n",
       "4. 91\n",
       "5. 54\n",
       "6. 57\n",
       "7. 37\n",
       "8. 74\n",
       "9. 15\n",
       "10. 82\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] 31 59 53 91 54 57 37 74 15 82"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "55.3"
      ],
      "text/latex": [
       "55.3"
      ],
      "text/markdown": [
       "55.3"
      ],
      "text/plain": [
       "[1] 55.3"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "23.3573685732504"
      ],
      "text/latex": [
       "23.3573685732504"
      ],
      "text/markdown": [
       "23.3573685732504"
      ],
      "text/plain": [
       "[1] 23.35737"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "b <- runif(10, min=1, max=10)\n",
    "c <- sample(1:100,10)\n",
    "c\n",
    "\n",
    "mean(c)\n",
    "sd(c)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "739c07bf",
   "metadata": {
    "papermill": {
     "duration": 0.013567,
     "end_time": "2023-06-06T12:31:14.627771",
     "exception": false,
     "start_time": "2023-06-06T12:31:14.614204",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(h) Create a 2-dimensional array of 3 rows and 4 columns with random integer values. Then, calculate the sum of each row and column.**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "230e68ee",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:14.657135Z",
     "iopub.status.busy": "2023-06-06T12:31:14.655851Z",
     "iopub.status.idle": "2023-06-06T12:31:14.683756Z",
     "shell.execute_reply": "2023-06-06T12:31:14.682044Z"
    },
    "papermill": {
     "duration": 0.045142,
     "end_time": "2023-06-06T12:31:14.686329",
     "exception": false,
     "start_time": "2023-06-06T12:31:14.641187",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "     [,1] [,2] [,3] [,4]\n",
      "[1,]    4    2    1    7\n",
      "[2,]    4    7    3    7\n",
      "[3,]    3    9    3    5\n",
      "[1] 14 21 20\n",
      "[1] 11 18  7 19\n"
     ]
    }
   ],
   "source": [
    "array <- matrix(sample.int(10, size = 12, replace = TRUE), nrow = 3, ncol = 4)\n",
    "\n",
    "print(array)\n",
    "\n",
    "row_sum <- rowSums(array)\n",
    "\n",
    "print(row_sum)\n",
    "\n",
    "col_sum <- colSums(array)\n",
    "\n",
    "print(col_sum)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "27236298",
   "metadata": {
    "papermill": {
     "duration": 0.013502,
     "end_time": "2023-06-06T12:31:14.713179",
     "exception": false,
     "start_time": "2023-06-06T12:31:14.699677",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(i) Create a DataFrame with 3 columns: \"Name\", \"Age\", and \"City\". Add at least 5 rows of data to the DataFrame. Then, filter the DataFrame to only include rows where the person's age is greater than or equal to 30.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "4a325fba",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:14.744071Z",
     "iopub.status.busy": "2023-06-06T12:31:14.742676Z",
     "iopub.status.idle": "2023-06-06T12:31:14.763992Z",
     "shell.execute_reply": "2023-06-06T12:31:14.762227Z"
    },
    "papermill": {
     "duration": 0.039289,
     "end_time": "2023-06-06T12:31:14.766501",
     "exception": false,
     "start_time": "2023-06-06T12:31:14.727212",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "  Nombre Edad Ciudad\n",
      "2  Mario   35 Ambato\n",
      "3   Luis   40 Cuenca\n",
      "5  Pedro   32  Manta\n"
     ]
    }
   ],
   "source": [
    "datos <- data.frame(\n",
    "  Nombre = c(\"Diego\", \"Mario\", \"Luis\", \"Maria\", \"Pedro\"),\n",
    "  Edad = c(25, 35, 40, 28, 32),\n",
    "  Ciudad = c(\"Quito\", \"Ambato\", \"Cuenca\", \"Portoviejo\", \"Manta\")\n",
    ")\n",
    "\n",
    "datos_fil <- subset(datos, Edad >= 30)\n",
    "print(datos_fil)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2a52e67e",
   "metadata": {
    "papermill": {
     "duration": 0.013378,
     "end_time": "2023-06-06T12:31:14.793071",
     "exception": false,
     "start_time": "2023-06-06T12:31:14.779693",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(k) Load a CSV file into a DataFrame and then calculate the mean, median, and mode of one of the columns in the DataFrame.**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "c6453894",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:14.823384Z",
     "iopub.status.busy": "2023-06-06T12:31:14.822027Z",
     "iopub.status.idle": "2023-06-06T12:31:15.126430Z",
     "shell.execute_reply": "2023-06-06T12:31:15.124541Z"
    },
    "papermill": {
     "duration": 0.322164,
     "end_time": "2023-06-06T12:31:15.128830",
     "exception": false,
     "start_time": "2023-06-06T12:31:14.806666",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] 50426.22\n",
      "[1] 46016\n",
      "[1] 88380\n"
     ]
    }
   ],
   "source": [
    "df1 <- read.csv(\"../input/servicearea/ServiceArea.csv\")\n",
    "\n",
    "print(media1 <- mean(df1$IssuerId2))\n",
    "print(mediana1 <- median(df1$IssuerId2))\n",
    "print(moda1 <- as.numeric(names(table(df1$IssuerId2)[table(df1$IssuerId2)== max(table(df1$IssuerId2))])))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "278a9245",
   "metadata": {
    "papermill": {
     "duration": 0.014171,
     "end_time": "2023-06-06T12:31:15.158078",
     "exception": false,
     "start_time": "2023-06-06T12:31:15.143907",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(l) Create a scatter plot of random x and y values between 1 and 100.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "58a507d5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:15.189733Z",
     "iopub.status.busy": "2023-06-06T12:31:15.188349Z",
     "iopub.status.idle": "2023-06-06T12:31:15.419435Z",
     "shell.execute_reply": "2023-06-06T12:31:15.416638Z"
    },
    "papermill": {
     "duration": 0.250243,
     "end_time": "2023-06-06T12:31:15.422359",
     "exception": false,
     "start_time": "2023-06-06T12:31:15.172116",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n/wOHNcmdWKhHaQAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "x_val <- runif(50, 1, 100)\n",
    "y_val <- runif(50, 1, 100)\n",
    "\n",
    "plot(x_val, y_val, main=\"Grafico\", xlab=\"X\", ylab=\"Y\",pch=16)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "372c0f3f",
   "metadata": {
    "papermill": {
     "duration": 0.014612,
     "end_time": "2023-06-06T12:31:15.452278",
     "exception": false,
     "start_time": "2023-06-06T12:31:15.437666",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(m) Load a CSV file into a DataFrame and then create a line chart of one of the columns in the DataFrame**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "037a61e8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:15.483668Z",
     "iopub.status.busy": "2023-06-06T12:31:15.482179Z",
     "iopub.status.idle": "2023-06-06T12:31:15.881603Z",
     "shell.execute_reply": "2023-06-06T12:31:15.879980Z"
    },
    "papermill": {
     "duration": 0.418023,
     "end_time": "2023-06-06T12:31:15.884630",
     "exception": false,
     "start_time": "2023-06-06T12:31:15.466607",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nbhUmiyow999//5dffmmV8UYNp8mtyYD3tob1zc8NKS8v12qNgXE6nd4eatTLz88/fvy4qV7D\nMpAEh6+gstIx8XxVtSv5Rz4Te8z45OakiNVTR+64WGlIVAaaOnVqfT2Inj59WgiheZ89odOc\nZP1dOGLEiMGDBwt1ST/0YcLmZsKQ6jNp0iRhtXpuod0LM7NSYtc/zlW25YXzVVeccRV77OI/\nPVr1/d6bb5tvuVOxymY8YcKE6667roEZTNsHpg5p09q1a2fMmPHkk0+qWYjJj7MBXIM5efJk\namrq7NmzH3zwwaDF1QSB7WGTl0uwNZqsXLhwwWdKSUnJI488on7VFtrzJ0+eTEpKMkk9D4yG\nezs8PNwMQ2k1a9Ys4O+uX79+xowZ27Zt0zAeWZn0xF+nGfd0WDZ7dbefPrHsNw/npP/3wYWU\n62Z+cM/SW9+c1ntK5IqX7jUwwqYK3lFS1gtO9fHuSe8TLRs3bty4caPn76Z2oH/58mXPLScd\nTmOxsbHef7VVZ/Butzs5OfkXv/iF5qvTgYWyiuBRFKXR+6Heu5DePbZz586dO3cK1YNJaFsE\n2lb+2rElJCS0bt1ak4UbxbNRAdwB99kb4eHhK1eu7Nu3r1aBNTUAjyYdeXzq6ubNmzdv3lx7\nOmqzUmLX9amVP13Rcen7T+V+8ExaZptXN2/NT/zPT5Afv/Z/jx7p8ezLk9Pee6H5ed9fq6YV\nvCtqIfuqvzexu+GGG5YsWeL5u1WrVk1ayPvvv+/5Q4dLnn369Nm+fXtycnKwV+ThdrtDsFZY\nS8MF5OdvtpKSkrFjx545c8Y75cMPP7zmmmsyMzPVxKZtixgzZkyPHj2ys7M1XKaXHFW9oKAg\nMTHRz16gG5aWlqZ+ISr5+arT2LFjn3766czMzO3bt9ecPm/evOHDh9NZQaOslNjZwlLe3VI6\n4LmnFv+/1Tu+OXCm8r8HOJsj4ZnlOzo889CzryzZ9b0FHraLioqaNWtW8F7oM3M3bGVlZaWl\nQX/ZJTIyMuCXP9q2bTtgwIDWrVtHRkZqG1WdcnJydFiLEKKiouLQoUNWv4bRVAG3gosXL373\n3XfaBhNUNbe0ZcuWPhvesmVLla9DDRw4cOrUqWqW4MNms/mZ1TW1EMvLy/fv3y/BpZ2OHTtq\n+xryvn373n///T179mi4TM3FxsbW+QukefPmErzSpwMrJXZCCJsjaeJjL098rK7PlPBxMxeM\n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\nCRI7AAAASfx/YifRsqfrocEAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "df2 <- read.csv(\"../input/servicearea/ServiceArea.csv\")\n",
    "plot(df2$IssuerId2, type=\"l\", main=\"Grafico de Lineas\", xlab = \"X\", ylab = \"Y\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "92b0e3d9",
   "metadata": {
    "papermill": {
     "duration": 0.016255,
     "end_time": "2023-06-06T12:31:15.916822",
     "exception": false,
     "start_time": "2023-06-06T12:31:15.900567",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 3. Data Import\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "20f78ee5",
   "metadata": {
    "papermill": {
     "duration": 0.015661,
     "end_time": "2023-06-06T12:31:15.948894",
     "exception": false,
     "start_time": "2023-06-06T12:31:15.933233",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## The Echocardiogram data set in the UCI Machine Learning repository contains information on a set of patients that suffered heart attacks at some point in the past"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7b49a7be",
   "metadata": {
    "papermill": {
     "duration": 0.016292,
     "end_time": "2023-06-06T12:31:15.980951",
     "exception": false,
     "start_time": "2023-06-06T12:31:15.964659",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(a) Download the Echocardiogram data set and import it to a data frame. Read the information on the data set and find out how missing values are represented and make sure that they are properly represented.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "f27c631a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:16.015992Z",
     "iopub.status.busy": "2023-06-06T12:31:16.014593Z",
     "iopub.status.idle": "2023-06-06T12:31:16.052624Z",
     "shell.execute_reply": "2023-06-06T12:31:16.050945Z"
    },
    "papermill": {
     "duration": 0.058171,
     "end_time": "2023-06-06T12:31:16.055047",
     "exception": false,
     "start_time": "2023-06-06T12:31:15.996876",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t133 obs. of  13 variables:\n",
      " $ V1 : chr  \"11\" \"19\" \"16\" \"57\" ...\n",
      " $ V2 : chr  \"0\" \"0\" \"0\" \"0\" ...\n",
      " $ V3 : chr  \"71\" \"72\" \"55\" \"60\" ...\n",
      " $ V4 : int  0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ V5 : chr  \"0.260\" \"0.380\" \"0.260\" \"0.253\" ...\n",
      " $ V6 : chr  \"9\" \"6\" \"4\" \"12.062\" ...\n",
      " $ V7 : chr  \"4.600\" \"4.100\" \"3.420\" \"4.603\" ...\n",
      " $ V8 : chr  \"14\" \"14\" \"14\" \"16\" ...\n",
      " $ V9 : chr  \"1\" \"1.700\" \"1\" \"1.450\" ...\n",
      " $ V10: chr  \"1\" \"0.588\" \"1\" \"0.788\" ...\n",
      " $ V11: chr  \"name\" \"name\" \"name\" \"name\" ...\n",
      " $ V12: chr  \"1\" \"1\" \"1\" \"1\" ...\n",
      " $ V13: chr  \"0\" \"0\" \"0\" \"0\" ...\n"
     ]
    }
   ],
   "source": [
    "df3 <- read.csv(\"/kaggle/input/echocardiogram/uci-echocardiogram/echocardiogram.data.csv\", header = FALSE)\n",
    "str(df3)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "595d2cba",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:16.091516Z",
     "iopub.status.busy": "2023-06-06T12:31:16.090109Z",
     "iopub.status.idle": "2023-06-06T12:31:16.113744Z",
     "shell.execute_reply": "2023-06-06T12:31:16.112158Z"
    },
    "papermill": {
     "duration": 0.044127,
     "end_time": "2023-06-06T12:31:16.115894",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.071767",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] 1\n",
      "\n",
      "FALSE  TRUE \n",
      " 1728     1 \n"
     ]
    }
   ],
   "source": [
    "val_null <- sum(is.na(df3))\n",
    "\n",
    "print(val_null)\n",
    "\n",
    "repre_null <- table(is.na(df3))\n",
    "\n",
    "print(repre_null)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "660b52d8",
   "metadata": {
    "papermill": {
     "duration": 0.016173,
     "end_time": "2023-06-06T12:31:16.149694",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.133521",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(b) Assign the attributes with meaningful names. You can look for this information on the same webpage.**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "95de4adf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:16.187353Z",
     "iopub.status.busy": "2023-06-06T12:31:16.185881Z",
     "iopub.status.idle": "2023-06-06T12:31:16.221598Z",
     "shell.execute_reply": "2023-06-06T12:31:16.219634Z"
    },
    "papermill": {
     "duration": 0.057517,
     "end_time": "2023-06-06T12:31:16.224359",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.166842",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Survival</th><th scope=col>StillAlive</th><th scope=col>Age</th><th scope=col>PericardialEffusion</th><th scope=col>FractionalShortening</th><th scope=col>EPSS</th><th scope=col>LVDD</th><th scope=col>WallMotionScore</th><th scope=col>WallMotionIndex</th><th scope=col>Mult</th><th scope=col>Name</th><th scope=col>Group</th><th scope=col>AliveAt1</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>11</td><td>0</td><td>71</td><td>0</td><td>0.260</td><td>9     </td><td>4.600</td><td>14</td><td>1    </td><td>1    </td><td>name</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>19</td><td>0</td><td>72</td><td>0</td><td>0.380</td><td>6     </td><td>4.100</td><td>14</td><td>1.700</td><td>0.588</td><td>name</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>16</td><td>0</td><td>55</td><td>0</td><td>0.260</td><td>4     </td><td>3.420</td><td>14</td><td>1    </td><td>1    </td><td>name</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>57</td><td>0</td><td>60</td><td>0</td><td>0.253</td><td>12.062</td><td>4.603</td><td>16</td><td>1.450</td><td>0.788</td><td>name</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>19</td><td>1</td><td>57</td><td>0</td><td>0.160</td><td>22    </td><td>5.750</td><td>18</td><td>2.250</td><td>0.571</td><td>name</td><td>1</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 13\n",
       "\\begin{tabular}{r|lllllllllllll}\n",
       "  & Survival & StillAlive & Age & PericardialEffusion & FractionalShortening & EPSS & LVDD & WallMotionScore & WallMotionIndex & Mult & Name & Group & AliveAt1\\\\\n",
       "  & <chr> & <chr> & <chr> & <int> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 11 & 0 & 71 & 0 & 0.260 & 9      & 4.600 & 14 & 1     & 1     & name & 1 & 0\\\\\n",
       "\t2 & 19 & 0 & 72 & 0 & 0.380 & 6      & 4.100 & 14 & 1.700 & 0.588 & name & 1 & 0\\\\\n",
       "\t3 & 16 & 0 & 55 & 0 & 0.260 & 4      & 3.420 & 14 & 1     & 1     & name & 1 & 0\\\\\n",
       "\t4 & 57 & 0 & 60 & 0 & 0.253 & 12.062 & 4.603 & 16 & 1.450 & 0.788 & name & 1 & 0\\\\\n",
       "\t5 & 19 & 1 & 57 & 0 & 0.160 & 22     & 5.750 & 18 & 2.250 & 0.571 & name & 1 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 13\n",
       "\n",
       "| <!--/--> | Survival &lt;chr&gt; | StillAlive &lt;chr&gt; | Age &lt;chr&gt; | PericardialEffusion &lt;int&gt; | FractionalShortening &lt;chr&gt; | EPSS &lt;chr&gt; | LVDD &lt;chr&gt; | WallMotionScore &lt;chr&gt; | WallMotionIndex &lt;chr&gt; | Mult &lt;chr&gt; | Name &lt;chr&gt; | Group &lt;chr&gt; | AliveAt1 &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 11 | 0 | 71 | 0 | 0.260 | 9      | 4.600 | 14 | 1     | 1     | name | 1 | 0 |\n",
       "| 2 | 19 | 0 | 72 | 0 | 0.380 | 6      | 4.100 | 14 | 1.700 | 0.588 | name | 1 | 0 |\n",
       "| 3 | 16 | 0 | 55 | 0 | 0.260 | 4      | 3.420 | 14 | 1     | 1     | name | 1 | 0 |\n",
       "| 4 | 57 | 0 | 60 | 0 | 0.253 | 12.062 | 4.603 | 16 | 1.450 | 0.788 | name | 1 | 0 |\n",
       "| 5 | 19 | 1 | 57 | 0 | 0.160 | 22     | 5.750 | 18 | 2.250 | 0.571 | name | 1 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Survival StillAlive Age PericardialEffusion FractionalShortening EPSS   LVDD \n",
       "1 11       0          71  0                   0.260                9      4.600\n",
       "2 19       0          72  0                   0.380                6      4.100\n",
       "3 16       0          55  0                   0.260                4      3.420\n",
       "4 57       0          60  0                   0.253                12.062 4.603\n",
       "5 19       1          57  0                   0.160                22     5.750\n",
       "  WallMotionScore WallMotionIndex Mult  Name Group AliveAt1\n",
       "1 14              1               1     name 1     0       \n",
       "2 14              1.700           0.588 name 1     0       \n",
       "3 14              1               1     name 1     0       \n",
       "4 16              1.450           0.788 name 1     0       \n",
       "5 18              2.250           0.571 name 1     0       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "names(df3) <- c(\"Survival\", \"StillAlive\", \"Age\", \"PericardialEffusion\", \"FractionalShortening\", \"EPSS\", \"LVDD\", \"WallMotionScore\", \"WallMotionIndex\", \"Mult\", \"Name\", \"Group\", \"AliveAt1\")\n",
    "\n",
    "head(df3, 5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ef0a72ba",
   "metadata": {
    "papermill": {
     "duration": 0.015895,
     "end_time": "2023-06-06T12:31:16.256558",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.240663",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(c) According to that same information, is there any redundant or irrelevant attribute that you can remove? Remove them.**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "6462d6b3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:16.293216Z",
     "iopub.status.busy": "2023-06-06T12:31:16.291577Z",
     "iopub.status.idle": "2023-06-06T12:31:16.324398Z",
     "shell.execute_reply": "2023-06-06T12:31:16.322155Z"
    },
    "papermill": {
     "duration": 0.054563,
     "end_time": "2023-06-06T12:31:16.327304",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.272741",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 11</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Survival</th><th scope=col>StillAlive</th><th scope=col>Age</th><th scope=col>PericardialEffusion</th><th scope=col>FractionalShortening</th><th scope=col>EPSS</th><th scope=col>LVDD</th><th scope=col>WallMotionScore</th><th scope=col>WallMotionIndex</th><th scope=col>Mult</th><th scope=col>AliveAt1</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>11</td><td>0</td><td>71</td><td>0</td><td>0.260</td><td>9     </td><td>4.600</td><td>14</td><td>1    </td><td>1    </td><td>0</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>19</td><td>0</td><td>72</td><td>0</td><td>0.380</td><td>6     </td><td>4.100</td><td>14</td><td>1.700</td><td>0.588</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>16</td><td>0</td><td>55</td><td>0</td><td>0.260</td><td>4     </td><td>3.420</td><td>14</td><td>1    </td><td>1    </td><td>0</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>57</td><td>0</td><td>60</td><td>0</td><td>0.253</td><td>12.062</td><td>4.603</td><td>16</td><td>1.450</td><td>0.788</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>19</td><td>1</td><td>57</td><td>0</td><td>0.160</td><td>22    </td><td>5.750</td><td>18</td><td>2.250</td><td>0.571</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 11\n",
       "\\begin{tabular}{r|lllllllllll}\n",
       "  & Survival & StillAlive & Age & PericardialEffusion & FractionalShortening & EPSS & LVDD & WallMotionScore & WallMotionIndex & Mult & AliveAt1\\\\\n",
       "  & <chr> & <chr> & <chr> & <int> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 11 & 0 & 71 & 0 & 0.260 & 9      & 4.600 & 14 & 1     & 1     & 0\\\\\n",
       "\t2 & 19 & 0 & 72 & 0 & 0.380 & 6      & 4.100 & 14 & 1.700 & 0.588 & 0\\\\\n",
       "\t3 & 16 & 0 & 55 & 0 & 0.260 & 4      & 3.420 & 14 & 1     & 1     & 0\\\\\n",
       "\t4 & 57 & 0 & 60 & 0 & 0.253 & 12.062 & 4.603 & 16 & 1.450 & 0.788 & 0\\\\\n",
       "\t5 & 19 & 1 & 57 & 0 & 0.160 & 22     & 5.750 & 18 & 2.250 & 0.571 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 11\n",
       "\n",
       "| <!--/--> | Survival &lt;chr&gt; | StillAlive &lt;chr&gt; | Age &lt;chr&gt; | PericardialEffusion &lt;int&gt; | FractionalShortening &lt;chr&gt; | EPSS &lt;chr&gt; | LVDD &lt;chr&gt; | WallMotionScore &lt;chr&gt; | WallMotionIndex &lt;chr&gt; | Mult &lt;chr&gt; | AliveAt1 &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 11 | 0 | 71 | 0 | 0.260 | 9      | 4.600 | 14 | 1     | 1     | 0 |\n",
       "| 2 | 19 | 0 | 72 | 0 | 0.380 | 6      | 4.100 | 14 | 1.700 | 0.588 | 0 |\n",
       "| 3 | 16 | 0 | 55 | 0 | 0.260 | 4      | 3.420 | 14 | 1     | 1     | 0 |\n",
       "| 4 | 57 | 0 | 60 | 0 | 0.253 | 12.062 | 4.603 | 16 | 1.450 | 0.788 | 0 |\n",
       "| 5 | 19 | 1 | 57 | 0 | 0.160 | 22     | 5.750 | 18 | 2.250 | 0.571 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Survival StillAlive Age PericardialEffusion FractionalShortening EPSS   LVDD \n",
       "1 11       0          71  0                   0.260                9      4.600\n",
       "2 19       0          72  0                   0.380                6      4.100\n",
       "3 16       0          55  0                   0.260                4      3.420\n",
       "4 57       0          60  0                   0.253                12.062 4.603\n",
       "5 19       1          57  0                   0.160                22     5.750\n",
       "  WallMotionScore WallMotionIndex Mult  AliveAt1\n",
       "1 14              1               1     0       \n",
       "2 14              1.700           0.588 0       \n",
       "3 14              1               1     0       \n",
       "4 16              1.450           0.788 0       \n",
       "5 18              2.250           0.571 0       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df3 <- df3[, !(names(df3) %in% c(\"Name\", \"Group\"))]\n",
    "\n",
    "head(df3, 5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c85bdce1",
   "metadata": {
    "papermill": {
     "duration": 0.017213,
     "end_time": "2023-06-06T12:31:16.362095",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.344882",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(d) Is there any data type change that you find useful? Perform it.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "bd8b446f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:16.428635Z",
     "iopub.status.busy": "2023-06-06T12:31:16.427089Z",
     "iopub.status.idle": "2023-06-06T12:31:16.458634Z",
     "shell.execute_reply": "2023-06-06T12:31:16.456775Z"
    },
    "papermill": {
     "duration": 0.082492,
     "end_time": "2023-06-06T12:31:16.461277",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.378785",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message in eval(expr, envir, enclos):\n",
      "“NAs introduced by coercion”\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t133 obs. of  11 variables:\n",
      " $ Survival            : chr  \"11\" \"19\" \"16\" \"57\" ...\n",
      " $ StillAlive          : chr  \"0\" \"0\" \"0\" \"0\" ...\n",
      " $ Age                 : num  71 72 55 60 57 68 62 60 46 54 ...\n",
      " $ PericardialEffusion : int  0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ FractionalShortening: chr  \"0.260\" \"0.380\" \"0.260\" \"0.253\" ...\n",
      " $ EPSS                : chr  \"9\" \"6\" \"4\" \"12.062\" ...\n",
      " $ LVDD                : chr  \"4.600\" \"4.100\" \"3.420\" \"4.603\" ...\n",
      " $ WallMotionScore     : chr  \"14\" \"14\" \"14\" \"16\" ...\n",
      " $ WallMotionIndex     : chr  \"1\" \"1.700\" \"1\" \"1.450\" ...\n",
      " $ Mult                : chr  \"1\" \"0.588\" \"1\" \"0.788\" ...\n",
      " $ AliveAt1            : chr  \"0\" \"0\" \"0\" \"0\" ...\n"
     ]
    }
   ],
   "source": [
    "df3$Age <- as.numeric(df3$Age)\n",
    "\n",
    "str(df3)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7fdb7621",
   "metadata": {
    "papermill": {
     "duration": 0.016767,
     "end_time": "2023-06-06T12:31:16.495208",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.478441",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 4. Data Manipulation"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "378b1814",
   "metadata": {
    "papermill": {
     "duration": 0.016841,
     "end_time": "2023-06-06T12:31:16.529266",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.512425",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Load the airquality data set regarding a set of New York Air Quality Measurements."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "461ba066",
   "metadata": {
    "papermill": {
     "duration": 0.016409,
     "end_time": "2023-06-06T12:31:16.562172",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.545763",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(n) For which attributes are there missing values?**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "fa5e23ad",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:16.599039Z",
     "iopub.status.busy": "2023-06-06T12:31:16.597496Z",
     "iopub.status.idle": "2023-06-06T12:31:16.657151Z",
     "shell.execute_reply": "2023-06-06T12:31:16.655285Z"
    },
    "papermill": {
     "duration": 0.081235,
     "end_time": "2023-06-06T12:31:16.659887",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.578652",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>V1</th><th scope=col>V2</th><th scope=col>V3</th><th scope=col>V4</th><th scope=col>V5</th><th scope=col>V6</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>Ozone</td><td>Solar.R</td><td>Wind</td><td>Temp</td><td>Month</td><td>Day</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>41   </td><td>190    </td><td>7.4 </td><td>67  </td><td>5    </td><td>1  </td></tr>\n",
       "\t<tr><th scope=row>3</th><td>36   </td><td>118    </td><td>8   </td><td>72  </td><td>5    </td><td>2  </td></tr>\n",
       "\t<tr><th scope=row>4</th><td>12   </td><td>149    </td><td>12.6</td><td>74  </td><td>5    </td><td>3  </td></tr>\n",
       "\t<tr><th scope=row>5</th><td>18   </td><td>313    </td><td>11.5</td><td>62  </td><td>5    </td><td>4  </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 6\n",
       "\\begin{tabular}{r|llllll}\n",
       "  & V1 & V2 & V3 & V4 & V5 & V6\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & Ozone & Solar.R & Wind & Temp & Month & Day\\\\\n",
       "\t2 & 41    & 190     & 7.4  & 67   & 5     & 1  \\\\\n",
       "\t3 & 36    & 118     & 8    & 72   & 5     & 2  \\\\\n",
       "\t4 & 12    & 149     & 12.6 & 74   & 5     & 3  \\\\\n",
       "\t5 & 18    & 313     & 11.5 & 62   & 5     & 4  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 6\n",
       "\n",
       "| <!--/--> | V1 &lt;chr&gt; | V2 &lt;chr&gt; | V3 &lt;chr&gt; | V4 &lt;chr&gt; | V5 &lt;chr&gt; | V6 &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| 1 | Ozone | Solar.R | Wind | Temp | Month | Day |\n",
       "| 2 | 41    | 190     | 7.4  | 67   | 5     | 1   |\n",
       "| 3 | 36    | 118     | 8    | 72   | 5     | 2   |\n",
       "| 4 | 12    | 149     | 12.6 | 74   | 5     | 3   |\n",
       "| 5 | 18    | 313     | 11.5 | 62   | 5     | 4   |\n",
       "\n"
      ],
      "text/plain": [
       "  V1    V2      V3   V4   V5    V6 \n",
       "1 Ozone Solar.R Wind Temp Month Day\n",
       "2 41    190     7.4  67   5     1  \n",
       "3 36    118     8    72   5     2  \n",
       "4 12    149     12.6 74   5     3  \n",
       "5 18    313     11.5 62   5     4  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df4 <- read.csv(\"/kaggle/input/new-york-air-quality/airquality.csv\", header = FALSE)\n",
    "head(df4, 5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "d69ee63e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:16.697222Z",
     "iopub.status.busy": "2023-06-06T12:31:16.695691Z",
     "iopub.status.idle": "2023-06-06T12:31:16.711476Z",
     "shell.execute_reply": "2023-06-06T12:31:16.709641Z"
    },
    "papermill": {
     "duration": 0.036733,
     "end_time": "2023-06-06T12:31:16.713719",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.676986",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "V1 V2 V3 V4 V5 V6 \n",
      "37  7  0  0  0  0 \n"
     ]
    }
   ],
   "source": [
    "mis_val<- colSums(is.na(df4))\n",
    "\n",
    "print(mis_val)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "09ec84e9",
   "metadata": {
    "papermill": {
     "duration": 0.017334,
     "end_time": "2023-06-06T12:31:16.748239",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.730905",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(o) Do all the attributes are in the most suitable data type? Make the changes you find necessary.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "db87f4e5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:16.785156Z",
     "iopub.status.busy": "2023-06-06T12:31:16.783845Z",
     "iopub.status.idle": "2023-06-06T12:31:16.814073Z",
     "shell.execute_reply": "2023-06-06T12:31:16.812412Z"
    },
    "papermill": {
     "duration": 0.050752,
     "end_time": "2023-06-06T12:31:16.816120",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.765368",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message in eval(expr, envir, enclos):\n",
      "“NAs introduced by coercion”\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>V1</th><th scope=col>V2</th><th scope=col>V3</th><th scope=col>V4</th><th scope=col>V5</th><th scope=col>V6</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>Ozone</td><td>Solar.R</td><td>Wind</td><td>NA</td><td>Month</td><td>Day</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>41   </td><td>190    </td><td>7.4 </td><td>67</td><td>5    </td><td>1  </td></tr>\n",
       "\t<tr><th scope=row>3</th><td>36   </td><td>118    </td><td>8   </td><td>72</td><td>5    </td><td>2  </td></tr>\n",
       "\t<tr><th scope=row>4</th><td>12   </td><td>149    </td><td>12.6</td><td>74</td><td>5    </td><td>3  </td></tr>\n",
       "\t<tr><th scope=row>5</th><td>18   </td><td>313    </td><td>11.5</td><td>62</td><td>5    </td><td>4  </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 6\n",
       "\\begin{tabular}{r|llllll}\n",
       "  & V1 & V2 & V3 & V4 & V5 & V6\\\\\n",
       "  & <chr> & <chr> & <chr> & <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & Ozone & Solar.R & Wind & NA & Month & Day\\\\\n",
       "\t2 & 41    & 190     & 7.4  & 67 & 5     & 1  \\\\\n",
       "\t3 & 36    & 118     & 8    & 72 & 5     & 2  \\\\\n",
       "\t4 & 12    & 149     & 12.6 & 74 & 5     & 3  \\\\\n",
       "\t5 & 18    & 313     & 11.5 & 62 & 5     & 4  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 6\n",
       "\n",
       "| <!--/--> | V1 &lt;chr&gt; | V2 &lt;chr&gt; | V3 &lt;chr&gt; | V4 &lt;dbl&gt; | V5 &lt;chr&gt; | V6 &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| 1 | Ozone | Solar.R | Wind | NA | Month | Day |\n",
       "| 2 | 41    | 190     | 7.4  | 67 | 5     | 1   |\n",
       "| 3 | 36    | 118     | 8    | 72 | 5     | 2   |\n",
       "| 4 | 12    | 149     | 12.6 | 74 | 5     | 3   |\n",
       "| 5 | 18    | 313     | 11.5 | 62 | 5     | 4   |\n",
       "\n"
      ],
      "text/plain": [
       "  V1    V2      V3   V4 V5    V6 \n",
       "1 Ozone Solar.R Wind NA Month Day\n",
       "2 41    190     7.4  67 5     1  \n",
       "3 36    118     8    72 5     2  \n",
       "4 12    149     12.6 74 5     3  \n",
       "5 18    313     11.5 62 5     4  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "no_mun <- !is.na(as.numeric(df4$V4))\n",
    "\n",
    "df4$V4[!no_mun] <- NA\n",
    "\n",
    "df4$V4 <- as.numeric(df4$V4)\n",
    "head(df4, 5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "bf0ae064",
   "metadata": {
    "papermill": {
     "duration": 0.016583,
     "end_time": "2023-06-06T12:31:16.849744",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.833161",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(p) What period of the year do these records refer to?**\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "df667c1a",
   "metadata": {
    "papermill": {
     "duration": 0.018083,
     "end_time": "2023-06-06T12:31:16.884718",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.866635",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(q) Load the package dplyr and save the data set in a table data frame format.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "1198c8dc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:16.923560Z",
     "iopub.status.busy": "2023-06-06T12:31:16.921909Z",
     "iopub.status.idle": "2023-06-06T12:31:16.944783Z",
     "shell.execute_reply": "2023-06-06T12:31:16.943063Z"
    },
    "papermill": {
     "duration": 0.044749,
     "end_time": "2023-06-06T12:31:16.946895",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.902146",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t154 obs. of  6 variables:\n",
      " $ V1: chr  \"Ozone\" \"41\" \"36\" \"12\" ...\n",
      " $ V2: chr  \"Solar.R\" \"190\" \"118\" \"149\" ...\n",
      " $ V3: chr  \"Wind\" \"7.4\" \"8\" \"12.6\" ...\n",
      " $ V4: num  NA 67 72 74 62 56 66 65 59 61 ...\n",
      " $ V5: chr  \"Month\" \"5\" \"5\" \"5\" ...\n",
      " $ V6: chr  \"Day\" \"1\" \"2\" \"3\" ...\n"
     ]
    }
   ],
   "source": [
    "library(dplyr)\n",
    "\n",
    "df5<- as.data.frame(df4)\n",
    "\n",
    "str(df5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "947bcc8d",
   "metadata": {
    "papermill": {
     "duration": 0.017202,
     "end_time": "2023-06-06T12:31:16.981080",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.963878",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(r) Select the days in May with a temperature above 70 Fahrenheit.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "92f69065",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:17.017474Z",
     "iopub.status.busy": "2023-06-06T12:31:17.016099Z",
     "iopub.status.idle": "2023-06-06T12:31:17.108358Z",
     "shell.execute_reply": "2023-06-06T12:31:17.106416Z"
    },
    "papermill": {
     "duration": 0.113301,
     "end_time": "2023-06-06T12:31:17.111022",
     "exception": false,
     "start_time": "2023-06-06T12:31:16.997721",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 7 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>V1</th><th scope=col>V2</th><th scope=col>V3</th><th scope=col>V4</th><th scope=col>V5</th><th scope=col>V6</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>36 </td><td>118</td><td>8   </td><td>72</td><td>5</td><td>2 </td></tr>\n",
       "\t<tr><td>12 </td><td>149</td><td>12.6</td><td>74</td><td>5</td><td>3 </td></tr>\n",
       "\t<tr><td>7  </td><td>NA </td><td>6.9 </td><td>74</td><td>5</td><td>11</td></tr>\n",
       "\t<tr><td>11 </td><td>320</td><td>16.6</td><td>73</td><td>5</td><td>22</td></tr>\n",
       "\t<tr><td>45 </td><td>252</td><td>14.9</td><td>81</td><td>5</td><td>29</td></tr>\n",
       "\t<tr><td>115</td><td>223</td><td>5.7 </td><td>79</td><td>5</td><td>30</td></tr>\n",
       "\t<tr><td>37 </td><td>279</td><td>7.4 </td><td>76</td><td>5</td><td>31</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 7 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " V1 & V2 & V3 & V4 & V5 & V6\\\\\n",
       " <chr> & <chr> & <chr> & <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 36  & 118 & 8    & 72 & 5 & 2 \\\\\n",
       "\t 12  & 149 & 12.6 & 74 & 5 & 3 \\\\\n",
       "\t 7   & NA  & 6.9  & 74 & 5 & 11\\\\\n",
       "\t 11  & 320 & 16.6 & 73 & 5 & 22\\\\\n",
       "\t 45  & 252 & 14.9 & 81 & 5 & 29\\\\\n",
       "\t 115 & 223 & 5.7  & 79 & 5 & 30\\\\\n",
       "\t 37  & 279 & 7.4  & 76 & 5 & 31\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 7 × 6\n",
       "\n",
       "| V1 &lt;chr&gt; | V2 &lt;chr&gt; | V3 &lt;chr&gt; | V4 &lt;dbl&gt; | V5 &lt;chr&gt; | V6 &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 36  | 118 | 8    | 72 | 5 | 2  |\n",
       "| 12  | 149 | 12.6 | 74 | 5 | 3  |\n",
       "| 7   | NA  | 6.9  | 74 | 5 | 11 |\n",
       "| 11  | 320 | 16.6 | 73 | 5 | 22 |\n",
       "| 45  | 252 | 14.9 | 81 | 5 | 29 |\n",
       "| 115 | 223 | 5.7  | 79 | 5 | 30 |\n",
       "| 37  | 279 | 7.4  | 76 | 5 | 31 |\n",
       "\n"
      ],
      "text/plain": [
       "  V1  V2  V3   V4 V5 V6\n",
       "1 36  118 8    72 5  2 \n",
       "2 12  149 12.6 74 5  3 \n",
       "3 7   NA  6.9  74 5  11\n",
       "4 11  320 16.6 73 5  22\n",
       "5 45  252 14.9 81 5  29\n",
       "6 115 223 5.7  79 5  30\n",
       "7 37  279 7.4  76 5  31"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(dplyr)\n",
    "mas70 <- df4 %>%\n",
    "  filter(V5 == 5, V4 > 70)\n",
    "\n",
    "mas70"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c385e4a4",
   "metadata": {
    "papermill": {
     "duration": 0.0174,
     "end_time": "2023-06-06T12:31:17.146187",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.128787",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(s) Create a new attribute TempC which represents the temperature values in Celsius.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "f5b63109",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:17.184296Z",
     "iopub.status.busy": "2023-06-06T12:31:17.182835Z",
     "iopub.status.idle": "2023-06-06T12:31:17.208489Z",
     "shell.execute_reply": "2023-06-06T12:31:17.206954Z"
    },
    "papermill": {
     "duration": 0.04691,
     "end_time": "2023-06-06T12:31:17.210611",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.163701",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>V1</th><th scope=col>V2</th><th scope=col>V3</th><th scope=col>V4</th><th scope=col>V5</th><th scope=col>V6</th><th scope=col>TempC</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>Ozone</td><td>Solar.R</td><td>Wind</td><td>NA</td><td>Month</td><td>Day</td><td>      NA</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>41   </td><td>190    </td><td>7.4 </td><td>67</td><td>5    </td><td>1  </td><td>19.44444</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>36   </td><td>118    </td><td>8   </td><td>72</td><td>5    </td><td>2  </td><td>22.22222</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>12   </td><td>149    </td><td>12.6</td><td>74</td><td>5    </td><td>3  </td><td>23.33333</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>18   </td><td>313    </td><td>11.5</td><td>62</td><td>5    </td><td>4  </td><td>16.66667</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 7\n",
       "\\begin{tabular}{r|lllllll}\n",
       "  & V1 & V2 & V3 & V4 & V5 & V6 & TempC\\\\\n",
       "  & <chr> & <chr> & <chr> & <dbl> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & Ozone & Solar.R & Wind & NA & Month & Day &       NA\\\\\n",
       "\t2 & 41    & 190     & 7.4  & 67 & 5     & 1   & 19.44444\\\\\n",
       "\t3 & 36    & 118     & 8    & 72 & 5     & 2   & 22.22222\\\\\n",
       "\t4 & 12    & 149     & 12.6 & 74 & 5     & 3   & 23.33333\\\\\n",
       "\t5 & 18    & 313     & 11.5 & 62 & 5     & 4   & 16.66667\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 7\n",
       "\n",
       "| <!--/--> | V1 &lt;chr&gt; | V2 &lt;chr&gt; | V3 &lt;chr&gt; | V4 &lt;dbl&gt; | V5 &lt;chr&gt; | V6 &lt;chr&gt; | TempC &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| 1 | Ozone | Solar.R | Wind | NA | Month | Day |       NA |\n",
       "| 2 | 41    | 190     | 7.4  | 67 | 5     | 1   | 19.44444 |\n",
       "| 3 | 36    | 118     | 8    | 72 | 5     | 2   | 22.22222 |\n",
       "| 4 | 12    | 149     | 12.6 | 74 | 5     | 3   | 23.33333 |\n",
       "| 5 | 18    | 313     | 11.5 | 62 | 5     | 4   | 16.66667 |\n",
       "\n"
      ],
      "text/plain": [
       "  V1    V2      V3   V4 V5    V6  TempC   \n",
       "1 Ozone Solar.R Wind NA Month Day       NA\n",
       "2 41    190     7.4  67 5     1   19.44444\n",
       "3 36    118     8    72 5     2   22.22222\n",
       "4 12    149     12.6 74 5     3   23.33333\n",
       "5 18    313     11.5 62 5     4   16.66667"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df4$TempC <- (df4$V4 - 32) * (5/9)\n",
    "\n",
    "head(df4, 5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "72b9794c",
   "metadata": {
    "papermill": {
     "duration": 0.019002,
     "end_time": "2023-06-06T12:31:17.248175",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.229173",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(t) Inspect which were the 30 hottest days.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "9de1bd90",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:17.286817Z",
     "iopub.status.busy": "2023-06-06T12:31:17.285341Z",
     "iopub.status.idle": "2023-06-06T12:31:17.323316Z",
     "shell.execute_reply": "2023-06-06T12:31:17.321277Z"
    },
    "papermill": {
     "duration": 0.059536,
     "end_time": "2023-06-06T12:31:17.325428",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.265892",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "     V1   V2   V3 V4 V5 V6    TempC\n",
      "1    76  203  9.7 97  8 28 36.11111\n",
      "2    84  237  6.3 96  8 30 35.55556\n",
      "3   118  225  2.3 94  8 29 34.44444\n",
      "4    85  188  6.3 94  8 31 34.44444\n",
      "5  <NA>  259 10.9 93  6 11 33.88889\n",
      "6    73  183  2.8 93  9  3 33.88889\n",
      "7    91  189  4.6 93  9  4 33.88889\n",
      "8  <NA>  250  9.2 92  6 12 33.33333\n",
      "9    97  267  6.3 92  7  8 33.33333\n",
      "10   97  272  5.7 92  7  9 33.33333\n",
      "11 <NA>  222  8.6 92  8 10 33.33333\n",
      "12   78  197  5.1 92  9  2 33.33333\n",
      "13 <NA>  291 14.9 91  7 14 32.77778\n",
      "14   96  167  6.9 91  9  1 32.77778\n",
      "15   71  291 13.8 90  6  9 32.22222\n",
      "16   89  229 10.3 90  8  8 32.22222\n",
      "17  110  207    8 90  8  9 32.22222\n",
      "18   85  175  7.4 89  7 10 31.66667\n",
      "19  122  255    4 89  8  7 31.66667\n",
      "20   77  276  5.1 88  7  7 31.11111\n",
      "21   82  213  7.4 88  7 28 31.11111\n",
      "22 <NA>  153  5.7 88  8 27 31.11111\n",
      "23 <NA>  273  6.9 87  6  8 30.55556\n",
      "24   39  323 11.5 87  6 10 30.55556\n",
      "25   79  187  5.1 87  7 19 30.55556\n",
      "26   66 <NA>  4.6 87  8  6 30.55556\n",
      "27   47   95  7.4 87  9  5 30.55556\n",
      "28   80  294  8.6 86  7 24 30.00000\n",
      "29   52   82   12 86  7 27 30.00000\n",
      "30   50  275  7.4 86  7 29 30.00000\n"
     ]
    }
   ],
   "source": [
    "library(dplyr)\n",
    "\n",
    "base_fil <- df4 %>%\n",
    "  arrange(desc(V4))\n",
    "\n",
    "cal_day <- head(base_fil, 30)\n",
    "\n",
    "print(cal_day)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "836353dd",
   "metadata": {
    "papermill": {
     "duration": 0.017535,
     "end_time": "2023-06-06T12:31:17.360778",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.343243",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(u) Inspect which were the hottest days, but also with the highest ozone values.**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "ddcd74d7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:17.399929Z",
     "iopub.status.busy": "2023-06-06T12:31:17.398302Z",
     "iopub.status.idle": "2023-06-06T12:31:17.431648Z",
     "shell.execute_reply": "2023-06-06T12:31:17.430094Z"
    },
    "papermill": {
     "duration": 0.05563,
     "end_time": "2023-06-06T12:31:17.433978",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.378348",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>V1</th><th scope=col>V2</th><th scope=col>V3</th><th scope=col>V4</th><th scope=col>V5</th><th scope=col>V6</th><th scope=col>TempC</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>41</td><td>190</td><td>7.4 </td><td>67</td><td>5</td><td>1</td><td>19.44444</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>36</td><td>118</td><td>8   </td><td>72</td><td>5</td><td>2</td><td>22.22222</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>12</td><td>149</td><td>12.6</td><td>74</td><td>5</td><td>3</td><td>23.33333</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>18</td><td>313</td><td>11.5</td><td>62</td><td>5</td><td>4</td><td>16.66667</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>NA</td><td>NA </td><td>14.3</td><td>56</td><td>5</td><td>5</td><td>13.33333</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 7\n",
       "\\begin{tabular}{r|lllllll}\n",
       "  & V1 & V2 & V3 & V4 & V5 & V6 & TempC\\\\\n",
       "  & <chr> & <chr> & <chr> & <dbl> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 41 & 190 & 7.4  & 67 & 5 & 1 & 19.44444\\\\\n",
       "\t2 & 36 & 118 & 8    & 72 & 5 & 2 & 22.22222\\\\\n",
       "\t3 & 12 & 149 & 12.6 & 74 & 5 & 3 & 23.33333\\\\\n",
       "\t4 & 18 & 313 & 11.5 & 62 & 5 & 4 & 16.66667\\\\\n",
       "\t5 & NA & NA  & 14.3 & 56 & 5 & 5 & 13.33333\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 7\n",
       "\n",
       "| <!--/--> | V1 &lt;chr&gt; | V2 &lt;chr&gt; | V3 &lt;chr&gt; | V4 &lt;dbl&gt; | V5 &lt;chr&gt; | V6 &lt;chr&gt; | TempC &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| 1 | 41 | 190 | 7.4  | 67 | 5 | 1 | 19.44444 |\n",
       "| 2 | 36 | 118 | 8    | 72 | 5 | 2 | 22.22222 |\n",
       "| 3 | 12 | 149 | 12.6 | 74 | 5 | 3 | 23.33333 |\n",
       "| 4 | 18 | 313 | 11.5 | 62 | 5 | 4 | 16.66667 |\n",
       "| 5 | NA | NA  | 14.3 | 56 | 5 | 5 | 13.33333 |\n",
       "\n"
      ],
      "text/plain": [
       "  V1 V2  V3   V4 V5 V6 TempC   \n",
       "1 41 190 7.4  67 5  1  19.44444\n",
       "2 36 118 8    72 5  2  22.22222\n",
       "3 12 149 12.6 74 5  3  23.33333\n",
       "4 18 313 11.5 62 5  4  16.66667\n",
       "5 NA NA  14.3 56 5  5  13.33333"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(dplyr)\n",
    "\n",
    "df4 <- df4 %>%\n",
    "  slice(-1)\n",
    "\n",
    "head(df4, 5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "183a6d0e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:17.474076Z",
     "iopub.status.busy": "2023-06-06T12:31:17.472654Z",
     "iopub.status.idle": "2023-06-06T12:31:17.517970Z",
     "shell.execute_reply": "2023-06-06T12:31:17.516349Z"
    },
    "papermill": {
     "duration": 0.06718,
     "end_time": "2023-06-06T12:31:17.520150",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.452970",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>V1</th><th scope=col>V2</th><th scope=col>V3</th><th scope=col>V4</th><th scope=col>V5</th><th scope=col>V6</th><th scope=col>TempC</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>76</td><td>203</td><td>9.7</td><td>97</td><td>8</td><td>28</td><td>36.11111</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 7\n",
       "\\begin{tabular}{r|lllllll}\n",
       "  & V1 & V2 & V3 & V4 & V5 & V6 & TempC\\\\\n",
       "  & <chr> & <chr> & <chr> & <dbl> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 76 & 203 & 9.7 & 97 & 8 & 28 & 36.11111\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 7\n",
       "\n",
       "| <!--/--> | V1 &lt;chr&gt; | V2 &lt;chr&gt; | V3 &lt;chr&gt; | V4 &lt;dbl&gt; | V5 &lt;chr&gt; | V6 &lt;chr&gt; | TempC &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| 1 | 76 | 203 | 9.7 | 97 | 8 | 28 | 36.11111 |\n",
       "\n"
      ],
      "text/plain": [
       "  V1 V2  V3  V4 V5 V6 TempC   \n",
       "1 76 203 9.7 97 8  28 36.11111"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(dplyr)\n",
    "\n",
    "call_day <- df4 %>%\n",
    "  filter(V4 == max(V4))\n",
    "\n",
    "final_day <- call_day %>%\n",
    "  filter(V1 == max(V1))\n",
    "\n",
    "head(final_day, 5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b936574a",
   "metadata": {
    "papermill": {
     "duration": 0.018364,
     "end_time": "2023-06-06T12:31:17.557494",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.539130",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(v) Inspect the number of days for which there was a register for each month.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "2048d5d0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:17.597213Z",
     "iopub.status.busy": "2023-06-06T12:31:17.595643Z",
     "iopub.status.idle": "2023-06-06T12:31:17.655040Z",
     "shell.execute_reply": "2023-06-06T12:31:17.653225Z"
    },
    "papermill": {
     "duration": 0.081553,
     "end_time": "2023-06-06T12:31:17.657309",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.575756",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 5 × 2\u001b[39m\n",
      "  V5       v6\n",
      "  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m\n",
      "\u001b[90m1\u001b[39m 5        31\n",
      "\u001b[90m2\u001b[39m 6        30\n",
      "\u001b[90m3\u001b[39m 7        31\n",
      "\u001b[90m4\u001b[39m 8        31\n",
      "\u001b[90m5\u001b[39m 9        30\n"
     ]
    }
   ],
   "source": [
    "library(dplyr)\n",
    "\n",
    "dias_mes <- df4 %>%\n",
    "  group_by(V5) %>%\n",
    "  summarize(v6 = n())\n",
    "\n",
    "print(dias_mes)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3e3eac9f",
   "metadata": {
    "papermill": {
     "duration": 0.018617,
     "end_time": "2023-06-06T12:31:17.694732",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.676115",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(w) For each month, obtain the minimum and the maximum temperature registered in Celsius.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "0fa0d438",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:17.736592Z",
     "iopub.status.busy": "2023-06-06T12:31:17.735113Z",
     "iopub.status.idle": "2023-06-06T12:31:17.772922Z",
     "shell.execute_reply": "2023-06-06T12:31:17.771254Z"
    },
    "papermill": {
     "duration": 0.06079,
     "end_time": "2023-06-06T12:31:17.775072",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.714282",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 5 × 3\u001b[39m\n",
      "  V5    MinTempC MaxTempC\n",
      "  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m    \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m    \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m\n",
      "\u001b[90m1\u001b[39m 5         13.3     27.2\n",
      "\u001b[90m2\u001b[39m 6         18.3     33.9\n",
      "\u001b[90m3\u001b[39m 7         22.8     33.3\n",
      "\u001b[90m4\u001b[39m 8         22.2     36.1\n",
      "\u001b[90m5\u001b[39m 9         17.2     33.9\n"
     ]
    }
   ],
   "source": [
    "library(dplyr)\n",
    "\n",
    "var_temp <- df4 %>%\n",
    "  group_by(V5) %>%\n",
    "  summarize(MinTempC = min(TempC, na.rm = TRUE),\n",
    "            MaxTempC = max(TempC, na.rm = TRUE))\n",
    "\n",
    "# Print the minimum and maximum temperature for each month\n",
    "print(var_temp)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c5835a47",
   "metadata": {
    "papermill": {
     "duration": 0.018964,
     "end_time": "2023-06-06T12:31:17.813204",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.794240",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**(x) Obtain the average of the following parameters by month: temperature in celsius, wind, solar radiation and ozone.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "5a50bd5f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:31:17.854329Z",
     "iopub.status.busy": "2023-06-06T12:31:17.852787Z",
     "iopub.status.idle": "2023-06-06T12:31:17.899316Z",
     "shell.execute_reply": "2023-06-06T12:31:17.897681Z"
    },
    "papermill": {
     "duration": 0.069853,
     "end_time": "2023-06-06T12:31:17.901431",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.831578",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 5 × 5\u001b[39m\n",
      "  V5    AvgTempC AvgWind AvgSolarRad AvgOzone\n",
      "  \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m    \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m   \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m    \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m\n",
      "\u001b[90m1\u001b[39m 5         18.6   11.6         181.     23.6\n",
      "\u001b[90m2\u001b[39m 6         26.2   10.3         190.     29.4\n",
      "\u001b[90m3\u001b[39m 7         28.8    8.94        216.     59.1\n",
      "\u001b[90m4\u001b[39m 8         28.9    8.79        172.     60.0\n",
      "\u001b[90m5\u001b[39m 9         24.9   10.2         167.     31.4\n"
     ]
    }
   ],
   "source": [
    "library(dplyr)\n",
    "\n",
    "datos <- df4 %>%\n",
    "  group_by(V5) %>%\n",
    "  summarize(AvgTempC = mean(TempC, na.rm = TRUE),\n",
    "            AvgWind = mean(as.numeric(as.character(V3)), na.rm = TRUE),\n",
    "            AvgSolarRad = mean(as.numeric(as.character(V2)), na.rm = TRUE),\n",
    "            AvgOzone = mean(as.numeric(as.character(V1)), na.rm = TRUE))\n",
    "\n",
    "print(datos)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "151b5745",
   "metadata": {
    "papermill": {
     "duration": 0.01948,
     "end_time": "2023-06-06T12:31:17.940188",
     "exception": false,
     "start_time": "2023-06-06T12:31:17.920708",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "(y) What values did you obtain regarding ozone and solar radiation attributes? Why? Make the\n",
    "necessary change so that you get the average of the registered values."
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 7.951122,
   "end_time": "2023-06-06T12:31:18.079180",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-06-06T12:31:10.128058",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
