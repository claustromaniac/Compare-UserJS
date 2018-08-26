- [**Introduction**](https://github.com/claustromaniac/Compare-UserJS#introduction)
- [**Requirements**](https://github.com/claustromaniac/Compare-UserJS#requirements)
- [**Instructions**](https://github.com/claustromaniac/Compare-UserJS#instructions)
- [**Parameters**](https://github.com/claustromaniac/Compare-UserJS#parameters)
- [**Examples and tips**](https://github.com/claustromaniac/Compare-UserJS#examples-and-tips)
- [**F.A.Q.**](https://github.com/claustromaniac/Compare-UserJS#faq-assuming-it-counts-when-im-the-one-asking)
- [**Acknowledgements**](https://github.com/claustromaniac/Compare-UserJS#acknowledgements)
<br><br><br>

Introduction
------------

No idea what a *user.js* is? Read [this article](https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/A_brief_guide_to_Mozilla_preferences).<br> *Note: For enhanced privacy and security I use (and recommend) the [ghacks-user.js](https://github.com/ghacksuserjs/ghacks-user.js).*

Compare-UserJS uses my own elegant <sup>[<i>Citation needed.</i>]</sup>  algorithm for parsing *user.js* files, and by default logs the results to *userJS_diff.log*.

Things detected (and reported) by this script:

- matching prefs, both value and state (active/inactive)
- prefs with different values but matching state
- prefs declared in file A but not in file B
- declared in file B but not in file A
- inactive (declared within JS comments) in A but active in B
- inactive in B but active in A
- duplicates in each of the two source files.

Additionally, it can catch one type of syntax error (for now), and includes that information in the report.

You can see an example of what the output looks like [here](userJS_diff.log).
<br><br>

Requirements
------------

PowerShell version 2 or higher, which comes pre-installed on Windows 7, but it *should* also run fine on Unix-like systems. You can download the latest version from the official [PowerShell repository](https://github.com/PowerShell/PowerShell).
<br><br>

Instructions
------------

The easiest way to use this tool:
1. Download both [*Compare-UserJS.bat*](https://raw.githubusercontent.com/claustromaniac/Compare-UserJS/master/Compare-UserJS.bat) and [*Compare-UserJS.ps1*](https://raw.githubusercontent.com/claustromaniac/Compare-UserJS/master/Compare-UserJS.ps1).
2. Place them in the same folder.
3. Drag and drop the two files that you want to compare on the *Compare-UserJS.bat*, simultaneously.

The *Compare-UserJS.bat* works as a launcher that makes it easier to run the PowerShell script. If you can't or don't want to use said batchfile, you will have to either relax the [execution policy](https://ss64.com/ps/set-executionpolicy.html) before starting, or manually create a new blank ps1 file and copy the text of this PowerShell script in it. In fact, you may even have to do both, depending on your system's configuration.

Compare-UserJS requires two parameters: the paths of the two files to be compared. You can pass them directly from the console/terminal, but it's not necessary because the script will prompt you to enter them during execution if you don't.

See the embedded help info with:
```PowerShell
Get-Help .\Compare-UserJS -full
```

Or just read it from the file, but that's less thrilling.
<br><br>

Parameters
-----------

|**Index** |   **Name**    | **Required?** |    **Default**    |                        **Description**                        |
|:--------:|:-------------:|:-------------:|:-----------------:|---------------------------------------------------------------|
|    0     | `filePath_A`  |      Yes      |                   | Path to the first file to compare. (1)                        |
|    1     | `filePath_B`  |      Yes      |                   | Path to the second file to compare.                           |
|    2     |  `ouputFile`  |      No       | *userJS_diff.log* | Path to the file where the report will be dumped.             |
|    3     |   `append`    |      No       |       false       | Append the report to the end of the file if it already exists.|
|    4     | `noCommentsA` |      No       |       false       | Parse JS comments in file A as code. (2)                      |
|    5     | `noCommentsB` |      No       |       false       | Parse JS comments in file B as code.                          |
|    6     |  `hideMask`   |      No       |         0         | Bitmask value for hiding parts of the report selectively. (3) |
|    7     |    `inJS`     |      No       |       false       | Get the report written in JavaScript. (4)                     |

<sub><em>
  1 - All path parameters can be absolute or relative. <br>
  2 - Mostly deprecated. It should make parsing slightly faster with files that you know beforehand that don't have comments. <br> 
  3 - See the embedded help info for details. <br>
  4 - It will be written to userJS_diff.js unless the -outputFile parameter is also specified.
</em></sub><br><br>


Examples and tips
-----------------

Compare fileA to fileB:
```PowerShell
.\Compare-UserJS.ps1 "C:\absolute\path\to\fileA" "..\relative\path\to\fileB"
```

Compare fileA to fileB, and save the report to report.txt, appending to the end of the file:
```PowerShell
.\Compare-UserJS.ps1 "fileA" "fileB" -outputFile "report.txt" -append
```

You can use this tool to assist you in making a manual clean up of your *prefs.js* too!
```PowerShell
.\Compare-UserJS.ps1 prefs.js user.js -hideMask 506 -inJS
```

Passing any parameters to the BAT is the same, except that you don't need the `.\`
```batchfile
Compare-UserJS.bat "fileA" "fileB"
```
<br>

F.A.Q. <sub><sup><sub>(assuming it counts when I'm the one asking)<sub></sup></sub>
-------

**Q: Why the heck did you make this?**

A: Firstly, to prove myself that I can produce nearly-awe-inducing garbage in under ~~200~~ 500 lines of code (I wish). Secondly, I have some shit to compare. Thirdly, I'm hooked on regular expressions. Fourthly, for learning purposes.
<br><br>


Acknowledgements
-----------------
[Thorin-Oakenpants](https://github.com/Thorin-Oakenpants) and [earthlng](https://github.com/earthlng) for their valuable feedback on the initial stages of this little project.
