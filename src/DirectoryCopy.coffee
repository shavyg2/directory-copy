path= require "path"
fs= require "fs"
mkdirp= require "mkdirp"

class DirectoryCopy
  constructor:(@input,@output,verbose=false)->
    @message=""
    @reader= require "node-dir"
    @base=path.resolve(@input)
    @log=@log.bind(@)
    process.log=console.log
    process.log "base is now #{@base}"

    @getFiles()
    if verbose
      console.log @message


  getFiles:->
    @reader.files(@base,(err,files)=>
      process.log "got the files and the length is #{files.length}"
      for f in files
        process.log "processing #{f}"
        fp=path.relative(@input,f)
        process.log "the file is #{fp}"
        input=path.resolve(@base,f)
        output=path.resolve(process.cwd(),@output,fp)
        process.log "we are moving from #{input} to #{output}"
        @writeFiles(input,output)
    )

  log:(text)->
    @message+="#{text}\n";

  writeFiles:(input,output)->
    fs.readFile(input,{encoding:"utf8"},(err,data)=>
      if err
        process.log "we have an error"
        process.log err.toString()
      else
        process.log "no error processing #{input} to #{output}"
      if typeof data is "undefined"
        data="";
      console.log()
      mkdirp(path.dirname(output),=>
        fs.writeFile(output,data,null,=>
          process.log("file saved, #{output}")
        )
      )
    );



exports.DirectoryCopy=DirectoryCopy