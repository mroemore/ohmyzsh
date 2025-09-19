huex() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: huex <shorthand> | <command>"
        echo "Example: echo '#ff0000' | huex 's10cL5f'"
        echo "Single-letter commands:"
        echo "  s[number]  - saturate (1-999 = 0.01-9.99)"
        echo "  d[number]  - desaturate (1-999 = 0.01-9.99)"
        echo "  k[number]  - darken (1-999 = 0.01-9.99)"
        echo "  l[number]  - lighten (1-999 = 0.01-9.99)"
        echo "  r[degrees] - rotate hue (integer degrees)"
        echo "  c          - complement"
        echo "  f          - format as hex"
        echo "  R[count]   - random RGB colors"
        echo "  V[count]   - random vivid colors"
        echo "  H[count]   - random LCH hue colors"
        echo "  G[count]   - random gray colors"
        echo "  D[count]   - distinct colors"
        echo "  g[count]   - gradient"
        echo "  1          - head first line"
        echo "  h[count]   - head count lines"
        echo "  t          - tail last line"
        echo "  T[count]   - tail count lines"
        echo "  e          - even lines"
        echo "  o          - odd lines"
        return 1
    fi

    local shorthand="$1"
    local pipeline=""
    local i=0
    local len=${#shorthand}

    while (( i < len )); do
        local cmd_char="${shorthand:$i:1}"
        local arg=""
        local j=$((i+1))

        # Extract numeric argument if present
        while (( j < len )) && [[ "${shorthand:$j:1}" =~ [0-9] ]]; do
            arg+="${shorthand:$j:1}"
            ((j++))
        done

        # Convert argument to decimal for specific commands
        local processed_arg=""
        if [[ -n "$arg" ]]; then
            case "$cmd_char" in
                "s"|"d"|"k"|"l")
                    # Convert 1-999 to 0.01-9.99
                    processed_arg=$(printf "%.2f" $((arg / 100.0)))
                    ;;
                *)
                    # Keep as integer for other commands
                    processed_arg="$arg"
                    ;;
            esac
        fi

        case "$cmd_char" in
            "s") pipeline+=" | pastel saturate ${processed_arg:-1}" ;;
            "d") pipeline+=" | pastel desaturate ${processed_arg:-1}" ;;
            "k") pipeline+=" | pastel darken ${processed_arg:-1}" ;;
            "l") pipeline+=" | pastel lighten ${processed_arg:-1}" ;;
            "r") pipeline+=" | pastel rotate ${processed_arg:-0}" ;;
            "c") pipeline+=" | pastel complement" ;;
            "f") pipeline+=" | pastel format hex" ;;
            "R") pipeline+=" | pastel random -s rgb -n ${processed_arg:-1}" ;;
            "V") pipeline+=" | pastel random -s vivid -n ${processed_arg:-1}" ;;
            "H") pipeline+=" | pastel random -s lch_hue -n ${processed_arg:-1}" ;;
            "G") pipeline+=" | pastel random -s gray -n ${processed_arg:-1}" ;;
            "D") pipeline+=" | xargs -d'\n' pastel distinct -m CIEDE2000 ${processed_arg:-4}" ;;
            "g") pipeline+=" | xargs -d'\n' pastel gradient --colorspace Lab --number ${processed_arg:-2}" ;;
            "1") pipeline+=" | head -n 1" ;;
            "h") pipeline+=" | head -n ${processed_arg:-10}" ;;
            "t") pipeline+=" | tail -n 1" ;;
            "T") pipeline+=" | tail -n ${processed_arg:-10}" ;;
            "e") pipeline+=" | awk 'NR % 2 == 0 {print \$0;}'" ;;
            "o") pipeline+=" | awk 'NR % 2 == 1 {print \$0;}'" ;;
            *)    echo "Unknown command: $cmd_char"; return 1 ;;
        esac

        i=$j
    done

    # Remove the leading " | " from the first command
    pipeline="${pipeline# | }"

    # Execute the pipeline
    eval "$pipeline"
}

# Completion function for the shorthand
_huex() {
    local -a commands
    commands=(
        's[number]:saturate by number% (1-999 = 0.01-9.99)'
        'd[number]:desaturate by number% (1-999 = 0.01-9.99)'
        'k[number]:darken by number% (1-999 = 0.01-9.99)'
        'l[number]:lighten by number% (1-999 = 0.01-9.99)'
        'r[degrees]:rotate hue by degrees'
        'c:complement color'
        'f:format as hex'
        'R[count]:random RGB colors'
        'V[count]:random vivid colors'
        'H[count]:random LCH hue colors'
        'G[count]:random gray colors'
        'D[count]:distinct colors'
        'g[count]:gradient with count colors'
        '1:head first line'
        'h[count]:head count lines'
        't:tail last line'
        'T[count]:tail count lines'
        'e:even lines'
        'o:odd lines'
    )

    _describe 'command' commands
}

compdef _huex huex
