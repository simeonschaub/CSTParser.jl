function Base.show(io::IO, x::INSTANCE,indent=0)
    println(io, "⊢","-"^indent, "($(x.val))")
end
function Base.show(io::IO, x::CALL,indent=0) 
    println(io, "⊢","-"^indent, x.name isa INSTANCE ? x.name.val : "call")
    for a in x.args
        show(io, a, indent+1)
    end 
end

function Base.show(io::IO, x::KEYWORD_BLOCK{0},indent=0)
    println(io, "⊢","-"^indent, x.opener.val)
end

function Base.show(io::IO, x::KEYWORD_BLOCK,indent=0)
    println(io, "⊢","-"^indent, x.opener.val)
end
function Base.show(io::IO, x::CURLY,indent=0)
    println(io, "⊢","-"^indent, "{}")
    for a in x.args
        show(io, a, indent+1)
    end 
end

function Base.show(io::IO, x::BLOCK,indent=0)
    for a in x.args[1:end]
        show(io, a, indent)
    end   
end

function Base.show(io::IO, x::KEYWORD_BLOCK{3},indent=0)
    println(io, "⊢","-"^indent, x.opener.val)
    for a in x.args[2:end]
        show(io, a, indent+1)
    end 
end

