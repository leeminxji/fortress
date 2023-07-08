# FORTRESS

## Godot Execution Order
```bash
# Node
Main
└─ Renderer

# Log
# [Main._init] start
# [Renderer._init] start
# [Renderer._init] end
# [Main._init] end
# [Main._enter_tree] start
# [Main._enter_tree] end
# [Renderer._enter_tree] start
# [Renderer._enter_tree] end
# [Renderer._ready] start
# [Renderer._ready] end
# [Main._ready] start
# [Main._ready] end
# [Main._physics_process] start
# [Main._physics_process] end
# [Renderer._physics_process] start
# [Renderer._physics_process] end
# [Main._process] start
# [Main._process] end
# [Renderer._process] start
# [Renderer._process] end

## @@ Main.queue_free() 실행

# [Renderer._exit_tree] start
# [Renderer._exit_tree] end
# [Main._exit_tree] start
# [Main._exit_tree] end
```
