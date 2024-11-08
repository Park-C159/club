# 定义变量
$DATA_DIR = "CBLUEDatasets"
$TASK_NAME = "ee"
$MODEL_TYPE = "bert"
$MODEL_DIR = "data/model_data"
$MODEL_NAME = "chinese-bert-wwm-ext"
$OUTPUT_DIR = "data/output"
$RESULT_OUTPUT_DIR = "data/result_output"
$MAX_LENGTH = 128

Write-Host "Start running"

# 判断输入参数
if ($args.Count -eq 0) {
    python baselines/run_classifier.py `
        --data_dir=$DATA_DIR `
        --model_type=$MODEL_TYPE `
        --model_dir=$MODEL_DIR `
        --model_name=$MODEL_NAME `
        --task_name=$TASK_NAME `
        --output_dir=$OUTPUT_DIR `
        --result_output_dir=$RESULT_OUTPUT_DIR `
        --do_train `
        --max_length=$MAX_LENGTH `
        --train_batch_size=16 `
        --eval_batch_size=16 `
        --learning_rate=3e-5 `
        --epochs=10 `
        --warmup_proportion=0.1 `
        --earlystop_patience=100 `
        --max_grad_norm=0.0 `
        --logging_steps=200 `
        --save_steps=200 `
        --seed=2021
} elseif ($args[0] -eq "predict") {
    python baselines/run_classifier.py `
        --data_dir=$DATA_DIR `
        --model_type=$MODEL_TYPE `
        --model_name=$MODEL_NAME `
        --model_dir=$MODEL_DIR `
        --task_name=$TASK_NAME `
        --output_dir=$OUTPUT_DIR `
        --result_output_dir=$RESULT_OUTPUT_DIR `
        --do_predict `
        --max_length=$MAX_LENGTH `
        --eval_batch_size=32 `
        --seed=2021
}
