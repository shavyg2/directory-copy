path= require "path"
fs= require "fs"
mkdirp= require "mkdirp"

class DirectoryCopy
  constructor:(@input,@output,verbose=false)->
    @message=""
    @reader= require "node-dir"
    @base=path.resolve(@input)
    @log=@log.bind(@)
    console.log "base is now #{@base}"
    @getFiles()


  getFiles:->
    @reader.files(@base,(err,files)=>
      console.log "got the files and the length is #{files.length}"
      for f in files
        console.log "processing #{f}"
        fp=path.relative(@input,f)
        console.log "the file is #{fp}"
        input=path.resolve(@base,f)
        output=path.resolve(process.cwd(),@output,fp)
        console.log "we are moving from #{input} to #{output}"
        @writeFiles(input,output)
    )

  log:(text)->
    @message+="#{text}\n";

  writeFiles:(input,output)->
    fs.readFile(input,{encoding:"utf8"},(err,data)=>
      if err
        console.log "we have an error"
        console.log err.toString()
      else
        console.log "no error processing #{input} to #{output}"
      if typeof data is "undefined"
        data="";
      console.log()
      mkdirp(path.dirname(output),=>
        fs.writeFile(output,data,null,=>
          console.log("file saved, #{output}")
        )
      )
    );



exports.DirectoryCopy=DirectoryCopy