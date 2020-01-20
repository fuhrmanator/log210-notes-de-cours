# Introduction

This is the first paragraph of the introduction chapter.

## First

This is the first subsection. Please, admire the gloriousnes of Figure \nameref{seagull_image}.


![A cool seagull.\label{seagull_image}](images/seagull.png)

## Second

This is the second subsection.


Please, check [First] subsection.

Please, check [this](#first) subsection.

Please, check Table \ref{example_table}.

| Index | Name |
| ----- | ---- |
| 0     | AAA  |
| 1     | BBB  |
| ...   | ...  |

Table: This is an example table.\label{example_table}

## Third

Formula example: $\mu = \sum_{i=0}^{N} \frac{x_i}{N}$

Now, full size:

$$\mu = \sum_{i=0}^{N} \frac{x_i}{N}$$

And a code sample:

```rb
def hello_world
  puts "hello world!"
end

hello_world
```

Check these unicode characters: ǽß¢ð€đŋμ


## PlantUML

See [(this is a link to whatever)](#whatever) for an example with options `{.plantuml #whatever caption="this is the caption" width=65%}`

```{.plantuml #whatever caption="this is the caption" width=65%}
Alice -> Bob: Authentication Request
Bob --> Alice: Authentication Response
```
