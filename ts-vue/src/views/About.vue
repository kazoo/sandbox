<template>
    <div class="about">
        <h1>hello {{ value | uppercase }}</h1>
        <input type="text" v-model="testInput">
        <div>
            {{ testInput | uppercase }}
        </div>
        <button @click="handleClick()">test</button>
    </div>
</template>

<script lang="ts">
import { Component, Prop, Emit, Watch, Vue } from 'vue-property-decorator';

@Component({
    filters: {
        uppercase(value: string): string | null {
            if (!value) {
                return null;
            }
            return value.toUpperCase();
        }
    }
})

export default class HelloTsVue extends Vue {
    @Prop() val!: string;

    value: string = this.val;
    testInput: string = '';

    @Watch('value')
    onValueChange(newVal: string, oldVal: string): void {
        console.log(`watch: ${newVal}, ${oldVal}`);
    }

    @Emit('handle-click')
    clickButton(val: string): void {
        console.log('button clicked', val);
    }

    /* lifecycle */
    created(): void {
        console.log('created');
    }

    mounted(): void {
        console.log('mounted');
    }

    /* methods */
    handleClick(): void {
        if (this.testInput === '') {
            return;
        }
        this.value = this.testInput;
        this.testInput = '';
        this.clickButton(this.value);
    }

}

</script>