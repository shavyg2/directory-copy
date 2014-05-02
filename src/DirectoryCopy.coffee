path= require "path"
fs= require "fs"
mkdirp= require "mkdirp"

class DirectoryCopy
  constructor:(@input,@output,@match=".*",@exclude)->
    @reader= require "node-dir"
    @base=path.resolve(@input)
    @getFiles()


  getFiles:->
    @reader.files(@base,(err,files)=>
      for f in files
        fp=path.relative(@input,f)
        input=path.resolve(@base,f)
        output=path.resolve(process.cwd(),@output,fp)
        @writeFiles(input,output)
    )


  writeFiles:(input,output)->
    fs.readFile(input,{encoding:"utf8"},(err,data)->
      #console.log err
      if typeof data is "undefined"
        data="";
      console.log()
      mkdirp(path.dirname(output),->
        fs.writeFile(output,data,null,->
          console.log("file saved, #{output}")
        )
      )
    );



exports.DirectoryCopy=DirectoryCopy