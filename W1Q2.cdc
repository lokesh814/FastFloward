pub struct Canvas{
    pub let width: UInt8
    pub let height:UInt8
    pub let pixels: String
    init(width: UInt8,height: UInt8, pixels: String){
        self.width= width
        self.height=height
        self.pixels=pixels
    }
}

pub fun serializeStringArray(_ lines: [String]): String{
    var buffer = ""
    for line in lines {
        buffer= buffer.concat(line)
    }
    return buffer
}

pub resource Picture {
  pub let canvas: Canvas
  
  init(canvas: Canvas) {
    self.canvas = canvas
  }
}


pub resource Printer {
   pub let rupee: [String]

   init(){
       self.rupee=[]
   }

  pub fun print(canvas: Canvas): @Picture?{
      if(!self.rupee.contains(canvas.pixels)) {
          log("You can print")
          self.rupee.append(canvas.pixels)
          return <- create Picture(canvas:canvas)
      }
      else{
          log("resource is already used")
          return nil
      }

  }
  
}


pub fun main() {
  let pixelsX = [
    "*   *",
    " * * ",
    "  *  ",
    " * * ",
    "*   *"
  ]
  let canvasX = Canvas(
    width: 5,
    height: 5,
    pixels: serializeStringArray(pixelsX)
  )
  let X <- create Printer()
  let y <- X.print(canvas:canvasX)
  let Y1 <- X.print(canvas:canvasX)

  
  destroy y;destroy Y1
  destroy X
}
