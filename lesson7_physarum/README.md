参考https://openprocessing.org/sketch/2020240
，进行了在processing上的改写


基于physarum（多头粘液菌丝仿真算法）的连续图案生成
面向对象编程，建立Cell类
可以调节三个滑块，分别控制探测深度（深度越高越“整体”）、字母种类和鼠标对Cell的吸引/排斥程度（程度越高越受鼠标影响）。

编程时遇到的问题：
由于对p5js不熟悉，一开始自己改写时生搬硬套，出现了很多莫名其妙的错误以至于跑不起来。一开始在cell类中参考原代码，使用了PVector进行计算，但是数据总是出现问题，一直出现loadpixels失败的情况。其实现在也没有想明白为什么，甚至出现了放五分钟代码自己跑了起来的状况。
求助老师后，终于成功地跑了起来！然后进行了一些细节调整，使它更接近原代码的外观。

希望能优化的方向：
希望能有更强的互动感，比如可以拖动两个字母进行融合，像拼接图案一样。
希望在实现“吸引”时，梯度可以做的更自然，现在是使用了if判断小于某个数都进行吸引，要是能实现距离越近吸引力越大就好了。