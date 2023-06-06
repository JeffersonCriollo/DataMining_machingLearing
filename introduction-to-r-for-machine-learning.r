{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "1b400c52",
   "metadata": {
    "papermill": {
     "duration": 0.015201,
     "end_time": "2023-06-06T12:25:48.156807",
     "exception": false,
     "start_time": "2023-06-06T12:25:48.141606",
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
   "id": "0a082638",
   "metadata": {
    "papermill": {
     "duration": 0.012691,
     "end_time": "2023-06-06T12:25:48.182710",
     "exception": false,
     "start_time": "2023-06-06T12:25:48.170019",
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
   "id": "a0951d92",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:48.214932Z",
     "iopub.status.busy": "2023-06-06T12:25:48.212270Z",
     "iopub.status.idle": "2023-06-06T12:25:49.390111Z",
     "shell.execute_reply": "2023-06-06T12:25:49.387810Z"
    },
    "papermill": {
     "duration": 1.196369,
     "end_time": "2023-06-06T12:25:49.393149",
     "exception": false,
     "start_time": "2023-06-06T12:25:48.196780",
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
   "id": "266f5611",
   "metadata": {
    "papermill": {
     "duration": 0.012422,
     "end_time": "2023-06-06T12:25:49.418932",
     "exception": false,
     "start_time": "2023-06-06T12:25:49.406510",
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
   "id": "90d65074",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:49.479618Z",
     "iopub.status.busy": "2023-06-06T12:25:49.447385Z",
     "iopub.status.idle": "2023-06-06T12:25:49.508872Z",
     "shell.execute_reply": "2023-06-06T12:25:49.507268Z"
    },
    "papermill": {
     "duration": 0.079169,
     "end_time": "2023-06-06T12:25:49.511211",
     "exception": false,
     "start_time": "2023-06-06T12:25:49.432042",
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
   "id": "0e77d096",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:49.542356Z",
     "iopub.status.busy": "2023-06-06T12:25:49.540893Z",
     "iopub.status.idle": "2023-06-06T12:25:49.583382Z",
     "shell.execute_reply": "2023-06-06T12:25:49.581351Z"
    },
    "papermill": {
     "duration": 0.061189,
     "end_time": "2023-06-06T12:25:49.586340",
     "exception": false,
     "start_time": "2023-06-06T12:25:49.525151",
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
       "<ol class=list-inline><li>20</li><li>19</li><li>40</li><li>63</li><li>94</li><li>78</li><li>3</li><li>29</li><li>90</li><li>86</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 20\n",
       "\\item 19\n",
       "\\item 40\n",
       "\\item 63\n",
       "\\item 94\n",
       "\\item 78\n",
       "\\item 3\n",
       "\\item 29\n",
       "\\item 90\n",
       "\\item 86\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 20\n",
       "2. 19\n",
       "3. 40\n",
       "4. 63\n",
       "5. 94\n",
       "6. 78\n",
       "7. 3\n",
       "8. 29\n",
       "9. 90\n",
       "10. 86\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] 20 19 40 63 94 78  3 29 90 86"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "52.2"
      ],
      "text/latex": [
       "52.2"
      ],
      "text/markdown": [
       "52.2"
      ],
      "text/plain": [
       "[1] 52.2"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "33.9077179021729"
      ],
      "text/latex": [
       "33.9077179021729"
      ],
      "text/markdown": [
       "33.9077179021729"
      ],
      "text/plain": [
       "[1] 33.90772"
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
   "id": "123f33f9",
   "metadata": {
    "papermill": {
     "duration": 0.014477,
     "end_time": "2023-06-06T12:25:49.615814",
     "exception": false,
     "start_time": "2023-06-06T12:25:49.601337",
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
   "id": "7cd0b126",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:49.648529Z",
     "iopub.status.busy": "2023-06-06T12:25:49.646962Z",
     "iopub.status.idle": "2023-06-06T12:25:49.678470Z",
     "shell.execute_reply": "2023-06-06T12:25:49.676656Z"
    },
    "papermill": {
     "duration": 0.050582,
     "end_time": "2023-06-06T12:25:49.680902",
     "exception": false,
     "start_time": "2023-06-06T12:25:49.630320",
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
      "[1,]    1    8    4    5\n",
      "[2,]    7    1    5    4\n",
      "[3,]    8    1   10    3\n",
      "[1] 18 17 22\n",
      "[1] 16 10 19 12\n"
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
   "id": "efb5c023",
   "metadata": {
    "papermill": {
     "duration": 0.015053,
     "end_time": "2023-06-06T12:25:49.711152",
     "exception": false,
     "start_time": "2023-06-06T12:25:49.696099",
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
   "id": "1801d6dc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:49.745425Z",
     "iopub.status.busy": "2023-06-06T12:25:49.743886Z",
     "iopub.status.idle": "2023-06-06T12:25:49.766457Z",
     "shell.execute_reply": "2023-06-06T12:25:49.764434Z"
    },
    "papermill": {
     "duration": 0.042565,
     "end_time": "2023-06-06T12:25:49.768927",
     "exception": false,
     "start_time": "2023-06-06T12:25:49.726362",
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
   "id": "427e0d9a",
   "metadata": {
    "papermill": {
     "duration": 0.015043,
     "end_time": "2023-06-06T12:25:49.799216",
     "exception": false,
     "start_time": "2023-06-06T12:25:49.784173",
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
   "id": "0b062e72",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:49.832684Z",
     "iopub.status.busy": "2023-06-06T12:25:49.831099Z",
     "iopub.status.idle": "2023-06-06T12:25:50.163454Z",
     "shell.execute_reply": "2023-06-06T12:25:50.161248Z"
    },
    "papermill": {
     "duration": 0.352349,
     "end_time": "2023-06-06T12:25:50.166408",
     "exception": false,
     "start_time": "2023-06-06T12:25:49.814059",
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
   "id": "7fb306e1",
   "metadata": {
    "papermill": {
     "duration": 0.014952,
     "end_time": "2023-06-06T12:25:50.196689",
     "exception": false,
     "start_time": "2023-06-06T12:25:50.181737",
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
   "id": "a592ddd2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:50.230684Z",
     "iopub.status.busy": "2023-06-06T12:25:50.228942Z",
     "iopub.status.idle": "2023-06-06T12:25:50.492000Z",
     "shell.execute_reply": "2023-06-06T12:25:50.490255Z"
    },
    "papermill": {
     "duration": 0.282801,
     "end_time": "2023-06-06T12:25:50.494648",
     "exception": false,
     "start_time": "2023-06-06T12:25:50.211847",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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"
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
   "id": "f48d814f",
   "metadata": {
    "papermill": {
     "duration": 0.015792,
     "end_time": "2023-06-06T12:25:50.526602",
     "exception": false,
     "start_time": "2023-06-06T12:25:50.510810",
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
   "id": "52eacbfd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:50.561576Z",
     "iopub.status.busy": "2023-06-06T12:25:50.560054Z",
     "iopub.status.idle": "2023-06-06T12:25:50.988922Z",
     "shell.execute_reply": "2023-06-06T12:25:50.987234Z"
    },
    "papermill": {
     "duration": 0.4495,
     "end_time": "2023-06-06T12:25:50.991957",
     "exception": false,
     "start_time": "2023-06-06T12:25:50.542457",
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
   "id": "8d4f4f85",
   "metadata": {
    "papermill": {
     "duration": 0.01714,
     "end_time": "2023-06-06T12:25:51.026874",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.009734",
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
   "id": "1480fe0e",
   "metadata": {
    "papermill": {
     "duration": 0.016887,
     "end_time": "2023-06-06T12:25:51.060780",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.043893",
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
   "id": "e938a838",
   "metadata": {
    "papermill": {
     "duration": 0.017117,
     "end_time": "2023-06-06T12:25:51.094824",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.077707",
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
   "id": "bd27d0ae",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:51.132723Z",
     "iopub.status.busy": "2023-06-06T12:25:51.130981Z",
     "iopub.status.idle": "2023-06-06T12:25:51.174742Z",
     "shell.execute_reply": "2023-06-06T12:25:51.172491Z"
    },
    "papermill": {
     "duration": 0.066153,
     "end_time": "2023-06-06T12:25:51.177644",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.111491",
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
   "id": "428d2317",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:51.215899Z",
     "iopub.status.busy": "2023-06-06T12:25:51.214212Z",
     "iopub.status.idle": "2023-06-06T12:25:51.242162Z",
     "shell.execute_reply": "2023-06-06T12:25:51.240091Z"
    },
    "papermill": {
     "duration": 0.050405,
     "end_time": "2023-06-06T12:25:51.245124",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.194719",
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
   "id": "542543bf",
   "metadata": {
    "papermill": {
     "duration": 0.017146,
     "end_time": "2023-06-06T12:25:51.279332",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.262186",
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
   "id": "a693b999",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:51.316112Z",
     "iopub.status.busy": "2023-06-06T12:25:51.314486Z",
     "iopub.status.idle": "2023-06-06T12:25:51.351432Z",
     "shell.execute_reply": "2023-06-06T12:25:51.349198Z"
    },
    "papermill": {
     "duration": 0.058395,
     "end_time": "2023-06-06T12:25:51.354402",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.296007",
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
   "id": "2366a9ca",
   "metadata": {
    "papermill": {
     "duration": 0.01771,
     "end_time": "2023-06-06T12:25:51.390083",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.372373",
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
   "id": "98224944",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:51.428881Z",
     "iopub.status.busy": "2023-06-06T12:25:51.427260Z",
     "iopub.status.idle": "2023-06-06T12:25:51.461054Z",
     "shell.execute_reply": "2023-06-06T12:25:51.458702Z"
    },
    "papermill": {
     "duration": 0.056246,
     "end_time": "2023-06-06T12:25:51.464065",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.407819",
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
   "id": "104d7ae6",
   "metadata": {
    "papermill": {
     "duration": 0.017699,
     "end_time": "2023-06-06T12:25:51.500006",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.482307",
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
   "id": "d0c1590f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:51.572558Z",
     "iopub.status.busy": "2023-06-06T12:25:51.571052Z",
     "iopub.status.idle": "2023-06-06T12:25:51.604331Z",
     "shell.execute_reply": "2023-06-06T12:25:51.602602Z"
    },
    "papermill": {
     "duration": 0.089494,
     "end_time": "2023-06-06T12:25:51.606693",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.517199",
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
   "id": "80284482",
   "metadata": {
    "papermill": {
     "duration": 0.017162,
     "end_time": "2023-06-06T12:25:51.641739",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.624577",
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
   "id": "74dae083",
   "metadata": {
    "papermill": {
     "duration": 0.018097,
     "end_time": "2023-06-06T12:25:51.677114",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.659017",
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
   "id": "0e1575d8",
   "metadata": {
    "papermill": {
     "duration": 0.017156,
     "end_time": "2023-06-06T12:25:51.712126",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.694970",
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
   "id": "11cd2419",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:51.751019Z",
     "iopub.status.busy": "2023-06-06T12:25:51.749366Z",
     "iopub.status.idle": "2023-06-06T12:25:51.814845Z",
     "shell.execute_reply": "2023-06-06T12:25:51.812417Z"
    },
    "papermill": {
     "duration": 0.088183,
     "end_time": "2023-06-06T12:25:51.817732",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.729549",
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
   "id": "15cf4c78",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:51.857547Z",
     "iopub.status.busy": "2023-06-06T12:25:51.856099Z",
     "iopub.status.idle": "2023-06-06T12:25:51.873414Z",
     "shell.execute_reply": "2023-06-06T12:25:51.871834Z"
    },
    "papermill": {
     "duration": 0.039817,
     "end_time": "2023-06-06T12:25:51.875681",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.835864",
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
   "id": "7a967857",
   "metadata": {
    "papermill": {
     "duration": 0.018106,
     "end_time": "2023-06-06T12:25:51.912175",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.894069",
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
   "id": "523c233a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:51.951270Z",
     "iopub.status.busy": "2023-06-06T12:25:51.949703Z",
     "iopub.status.idle": "2023-06-06T12:25:51.983558Z",
     "shell.execute_reply": "2023-06-06T12:25:51.981744Z"
    },
    "papermill": {
     "duration": 0.056001,
     "end_time": "2023-06-06T12:25:51.985939",
     "exception": false,
     "start_time": "2023-06-06T12:25:51.929938",
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
   "id": "476ce93c",
   "metadata": {
    "papermill": {
     "duration": 0.018204,
     "end_time": "2023-06-06T12:25:52.022876",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.004672",
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
   "id": "cb51d326",
   "metadata": {
    "papermill": {
     "duration": 0.018383,
     "end_time": "2023-06-06T12:25:52.059486",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.041103",
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
   "id": "ca0c2375",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:52.100007Z",
     "iopub.status.busy": "2023-06-06T12:25:52.098413Z",
     "iopub.status.idle": "2023-06-06T12:25:52.122604Z",
     "shell.execute_reply": "2023-06-06T12:25:52.120988Z"
    },
    "papermill": {
     "duration": 0.046657,
     "end_time": "2023-06-06T12:25:52.124954",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.078297",
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
   "id": "eac593d8",
   "metadata": {
    "papermill": {
     "duration": 0.018613,
     "end_time": "2023-06-06T12:25:52.162138",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.143525",
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
   "id": "1b19c5bb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:52.202780Z",
     "iopub.status.busy": "2023-06-06T12:25:52.201234Z",
     "iopub.status.idle": "2023-06-06T12:25:52.297478Z",
     "shell.execute_reply": "2023-06-06T12:25:52.295869Z"
    },
    "papermill": {
     "duration": 0.119346,
     "end_time": "2023-06-06T12:25:52.299951",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.180605",
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
   "id": "7d41dc12",
   "metadata": {
    "papermill": {
     "duration": 0.018949,
     "end_time": "2023-06-06T12:25:52.338063",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.319114",
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
   "id": "c5a9a0a1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:52.379989Z",
     "iopub.status.busy": "2023-06-06T12:25:52.378364Z",
     "iopub.status.idle": "2023-06-06T12:25:52.407860Z",
     "shell.execute_reply": "2023-06-06T12:25:52.406069Z"
    },
    "papermill": {
     "duration": 0.053109,
     "end_time": "2023-06-06T12:25:52.410023",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.356914",
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
   "id": "ffe01475",
   "metadata": {
    "papermill": {
     "duration": 0.019505,
     "end_time": "2023-06-06T12:25:52.448799",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.429294",
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
   "id": "9ea42779",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:52.491499Z",
     "iopub.status.busy": "2023-06-06T12:25:52.489914Z",
     "iopub.status.idle": "2023-06-06T12:25:52.530845Z",
     "shell.execute_reply": "2023-06-06T12:25:52.528997Z"
    },
    "papermill": {
     "duration": 0.064892,
     "end_time": "2023-06-06T12:25:52.533121",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.468229",
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
   "id": "e90692b3",
   "metadata": {
    "papermill": {
     "duration": 0.019272,
     "end_time": "2023-06-06T12:25:52.571350",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.552078",
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
   "id": "b817ea28",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:52.614046Z",
     "iopub.status.busy": "2023-06-06T12:25:52.612331Z",
     "iopub.status.idle": "2023-06-06T12:25:52.647355Z",
     "shell.execute_reply": "2023-06-06T12:25:52.645593Z"
    },
    "papermill": {
     "duration": 0.058958,
     "end_time": "2023-06-06T12:25:52.649630",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.590672",
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
   "id": "126e736a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:52.692850Z",
     "iopub.status.busy": "2023-06-06T12:25:52.691279Z",
     "iopub.status.idle": "2023-06-06T12:25:52.738234Z",
     "shell.execute_reply": "2023-06-06T12:25:52.736483Z"
    },
    "papermill": {
     "duration": 0.071434,
     "end_time": "2023-06-06T12:25:52.740570",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.669136",
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
   "id": "656a0443",
   "metadata": {
    "papermill": {
     "duration": 0.01933,
     "end_time": "2023-06-06T12:25:52.779245",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.759915",
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
   "id": "d35beb9c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:52.820948Z",
     "iopub.status.busy": "2023-06-06T12:25:52.819327Z",
     "iopub.status.idle": "2023-06-06T12:25:52.880780Z",
     "shell.execute_reply": "2023-06-06T12:25:52.879049Z"
    },
    "papermill": {
     "duration": 0.084531,
     "end_time": "2023-06-06T12:25:52.882915",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.798384",
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
   "id": "478d1605",
   "metadata": {
    "papermill": {
     "duration": 0.01976,
     "end_time": "2023-06-06T12:25:52.921897",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.902137",
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
   "id": "4a6c749d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:52.963702Z",
     "iopub.status.busy": "2023-06-06T12:25:52.962154Z",
     "iopub.status.idle": "2023-06-06T12:25:53.003170Z",
     "shell.execute_reply": "2023-06-06T12:25:53.001089Z"
    },
    "papermill": {
     "duration": 0.064571,
     "end_time": "2023-06-06T12:25:53.005627",
     "exception": false,
     "start_time": "2023-06-06T12:25:52.941056",
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
   "id": "06b96e23",
   "metadata": {
    "papermill": {
     "duration": 0.019712,
     "end_time": "2023-06-06T12:25:53.045656",
     "exception": false,
     "start_time": "2023-06-06T12:25:53.025944",
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
   "id": "7dbf7e7a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-06-06T12:25:53.087460Z",
     "iopub.status.busy": "2023-06-06T12:25:53.085890Z",
     "iopub.status.idle": "2023-06-06T12:25:53.134209Z",
     "shell.execute_reply": "2023-06-06T12:25:53.132229Z"
    },
    "papermill": {
     "duration": 0.071204,
     "end_time": "2023-06-06T12:25:53.136322",
     "exception": false,
     "start_time": "2023-06-06T12:25:53.065118",
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
   "id": "1f8ebb27",
   "metadata": {
    "papermill": {
     "duration": 0.019487,
     "end_time": "2023-06-06T12:25:53.174975",
     "exception": false,
     "start_time": "2023-06-06T12:25:53.155488",
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
   "duration": 8.58952,
   "end_time": "2023-06-06T12:25:53.315175",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-06-06T12:25:44.725655",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
