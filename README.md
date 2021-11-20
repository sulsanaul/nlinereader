# n-line reader

read a body of text n lines at a time from your terminal

`chmod 755 reader.sh`

`./reader.sh -f SOURCETEXT`

## example

`./reader.sh` (script will read from source.txt if no file is provided)

> Warning: source-pphr.txt already exists.\
> Any paraphrased text will be appended to EOF.\
> Rename source text to avoid this behavior.

> Reading 21 total sentences from source.txt...\
> [h] help

`h`

> \- [return] present 1 (interpreted) sentence\
> \- present [1-9] sentence(s)\
> \- [p] input paraphrased text\
> \- [n] get index of current sentence\
> \- [z] exit

`[return]`

> The Truce of Calais was a truce agreed by King Edward III of England and King Philip VI of France on 28 September 1347, which was mediated by emissaries of Pope Clement VI.

`[return]`

>  The Hundred Years' War had broken out in 1337 and in 1346 Edward had landed with an army in northern France.

`2`

>  After inflicting a heavy defeat on Philip and a French army at the Battle of Crécy the English besieged Calais, which fell after 11 months.

>  Both countries were financially and militarily exhausted and two cardinals acting for Pope Clement were able to broker a truce in a series of negotiations outside Calais.

`n`

> (4/21)

`p`

> source.txt:4 ~>
`everyone was tired so the pope proposed a truce`

`z`

> (21/21) Finished reading.\
> Paraphrased text added to source-pphr.txt.

`cat source-pphr.txt`

> everyone was tired so the pope proposed a truce