# de-zoomcamp-dbt

### Compilar la siguiente macro del modulo codegen para generar los yaml de los modelos del directorio core.

{% set models_to_generate = codegen.get_models(directory='core') %}  
{{ codegen.generate_model_yaml(  
    model_names = models_to_generate  
) }}

### Algunos comandos

dbt build  
dbt docs generate

#### Para delimitar el dataset
--dbt build --select <model_name> --vars '{'is_test_run': 'false'}'  
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}