local db = require('dashboard')



db.custom_header = {
'',
'██████╗  ██████╗ ███╗   ██╗████████╗    ██████╗  █████╗ ███╗   ██╗██╗ ██████╗',
'██╔══██╗██╔═══██╗████╗  ██║╚══██╔══╝    ██╔══██╗██╔══██╗████╗  ██║██║██╔════╝',
'██║  ██║██║   ██║██╔██╗ ██║   ██║       ██████╔╝███████║██╔██╗ ██║██║██║     ',
'██║  ██║██║   ██║██║╚██╗██║   ██║       ██╔═══╝ ██╔══██║██║╚██╗██║██║██║     ',
'██████╔╝╚██████╔╝██║ ╚████║   ██║       ██║     ██║  ██║██║ ╚████║██║╚██████╗',
'╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝       ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝',
''
}

db.custom_center = {
    {
        desc = ' Open file             ',
        action = 'FZF',
        shortcut = "SPC f o"
    }
}

local footer_quotes = {
    {
        "For instance, on the planet Earth, man had always assumed  ",
        "that he was more intelligent than dolphins because he had  ",
        "achieved so much - the wheel, New York, wars and so on —   ",
        "whilst all the dolphins had ever done was muck about in the",
        "water having a good time. But conversely, the dolphins had ",
        "always believed that they were far more intelligent than   ",
        "man - for precisely the same reasons.                      ",
    },
    {
        "The ships hung in the sky in much the same way that bricks don't.",
    },
    {
        "This planet has - or rather had - a problem, which was",
        "this: most of the people living on it were unhappy for",
        "pretty much of the time. Many solutions were suggested",
        "for this problem, but most of these were largely      ",
        "concerned with the movement of small green pieces of  ",
        "paper, which was odd because on the whole it wasn't   ",
        "the small green pieces of paper that were unhappy.    ",
    },
    {
        "Nothing travels faster than the speed of light with the possible",
        "exception of bad news, which obeys its own special laws.        ",
    },
    {
        "Flying is learning how to throw yourself at the ground and miss.",
    },
    {
        "There is a theory which states that if ever anyone     ",
        "discovers exactly what the Universe is for and why it  ",
        "is here, it will instantly disappear and be replaced by",
        "something even more bizarre and inexplicable.          ",
        "",
        "There is another theory which states that this has     ",
        "already happened.                                      ",
    },
    {
        "Time is an illusion. Lunchtime doubly so.",
    },
    {
        "A common mistake that people make when trying to design",
        "something completely foolproof is to underestimate the ",
        "ingenuity of complete fools                            ",
    },
    {
        "For a moment, nothing happened.                         ",
        "Then, after a second or so, nothing continued to happen.",
    },
}

math.randomseed(os.time())
db.custom_footer = footer_quotes[math.random(#footer_quotes)]
